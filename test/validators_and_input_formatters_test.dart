import 'package:flutter_test/flutter_test.dart';
import 'package:validators_and_input_formatters/validators_and_input_formatters.dart';
import 'package:validators_and_input_formatters/validators_and_input_formatters_platform_interface.dart';
import 'package:validators_and_input_formatters/validators_and_input_formatters_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockValidatorsAndInputFormattersPlatform
    with MockPlatformInterfaceMixin
    implements ValidatorsAndInputFormattersPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ValidatorsAndInputFormattersPlatform initialPlatform =
      ValidatorsAndInputFormattersPlatform.instance;

  test(
    '$MethodChannelValidatorsAndInputFormatters is the default instance',
    () {
      expect(
        initialPlatform,
        isInstanceOf<MethodChannelValidatorsAndInputFormatters>(),
      );
    },
  );

  test('getPlatformVersion', () async {
    ValidatorsAndInputFormatters validatorsAndInputFormattersPlugin =
        ValidatorsAndInputFormatters();
    MockValidatorsAndInputFormattersPlatform fakePlatform =
        MockValidatorsAndInputFormattersPlatform();
    ValidatorsAndInputFormattersPlatform.instance = fakePlatform;

    expect(await validatorsAndInputFormattersPlugin.getPlatformVersion(), '42');
  });
}
