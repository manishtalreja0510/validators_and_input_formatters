import 'validators_and_input_formatters_platform_interface.dart';

/// Validators and input formatters
class ValidatorsAndInputFormatters {
  /// this function can be used to get the platform version
  Future<String?> getPlatformVersion() {
    return ValidatorsAndInputFormattersPlatform.instance.getPlatformVersion();
  }
}
