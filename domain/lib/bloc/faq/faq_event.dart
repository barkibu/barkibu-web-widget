import 'package:built_value/built_value.dart';

part 'faq_event.g.dart';

abstract class FaqEvent {
  const FaqEvent();
}

abstract class FaqViewRequested extends FaqEvent implements Built<FaqViewRequested, FaqViewRequestedBuilder> {
  String get filter;

  FaqViewRequested._();

  factory FaqViewRequested([void Function(FaqViewRequestedBuilder) updates]) = _$FaqViewRequested;
}

abstract class FaqContentExpanded extends FaqEvent implements Built<FaqContentExpanded, FaqContentExpandedBuilder> {
  String get faqId;

  String get planName;

  FaqContentExpanded._();

  factory FaqContentExpanded([void Function(FaqContentExpandedBuilder) updates]) = _$FaqContentExpanded;
}
