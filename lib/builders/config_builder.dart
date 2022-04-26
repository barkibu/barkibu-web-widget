import 'dart:convert';

import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart';
import 'package:path/path.dart' as p;

const _configFile = 'config.g.dart';
const _versionFile = 'web/version';
final _formatter = DartFormatter();

/// [BuilderFactory], to be referenced in the
/// `builders.<builder name>.builder_factories` key of `build.yaml` files.
Builder configBuilder(BuilderOptions options) => ConfigBuilder(options.config);

/// Creates a file `lib/config.g.dart`. For each key/value pair declared in
/// the builder options in `build.yaml`, declares a top-level constant with the
/// key name.
class ConfigBuilder implements Builder {
  ConfigBuilder(this.values);

  final Map<String, dynamic> values;

  @override
  Map<String, List<String>> get buildExtensions => const {
        r'$lib$': [_configFile]
      };

  @override
  Future<void> build(BuildStep buildStep) async {
    final versionAssetId = AssetId(buildStep.inputId.package, _versionFile);
    final version = (await buildStep.readAsString(versionAssetId)).trim();
    var configEntries = values.entries.map((e) => _toDartConstantDeclaration(e.key, e.value)).toList();
    configEntries.add(_toDartConstantDeclaration('version', version));
    final configContent = _formatter.format(configEntries.join());
    final assetId = AssetId(buildStep.inputId.package, p.join('lib', _configFile));
    await buildStep.writeAsString(assetId, configContent);
  }

  String _toDartConstantDeclaration(String name, dynamic value) => 'const $name = ${jsonEncode(value)};';
}
