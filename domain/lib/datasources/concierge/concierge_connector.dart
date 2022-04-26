import 'dart:async';
import 'dart:convert';

import 'package:common_barkibu_dart/configuration.dart';
import 'package:common_barkibu_dart/datasources/concierge/retry_strategy.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:common_barkibu_dart/services/monitoring_service.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class ConciergeConnector {
  final Configuration config;
  Function(dynamic) onMessageReceived;
  Function() onConnectionErrored;

  void send(Map<String, dynamic> event);
  void close();
  ConciergeConnector(this.config);
}

class ConciergeConnectorImpl extends ConciergeConnector {
  final session = Uuid().v4();
  WebSocketChannel channel;
  RetryStrategy _retryStrategy;

  ConciergeConnectorImpl(Configuration config) : super(config) {
    _retryStrategy = RetryStrategy.launch(_listenChannel, onRepeatedFailure: () => onConnectionErrored());
  }

  Uri get conciergeUrl => Uri.parse('${config.conciergeUrl}?session=$session');

  @override
  void send(event) {
    channel.sink.add(json.encode(event));
  }

  Future<Null> _listenChannel() {
    final failureDetector = Completer<Null>();
    channel = WebSocketChannel.connect(conciergeUrl);
    channel.stream.listen((event) {
      onMessageReceived?.call(event);
    }, onDone: () {
      if (!failureDetector.isCompleted) failureDetector.complete();
    }, onError: (error) {
      if (!failureDetector.isCompleted) failureDetector.complete();
      ServiceLocator.container<MonitoringService>().capture(
          event: error, severityLevel: SeverityLevel.ERROR, stackTrace: 'lib/bloc/concierge/concierge_bloc.dart');
    });

    return failureDetector.future;
  }

  @override
  void close() {
    channel.sink.close();
    _retryStrategy.close();
  }
}
