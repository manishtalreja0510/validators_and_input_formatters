import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'validators_and_input_formatters_method_channel.dart';


/// ValidatorsAndInputFormattersPlatform
abstract class ValidatorsAndInputFormattersPlatform extends PlatformInterface {
  /// Constructs a ValidatorsAndInputFormattersPlatform.
  ValidatorsAndInputFormattersPlatform() : super(token: _token);

  static final Object _token = Object();

  static ValidatorsAndInputFormattersPlatform _instance = MethodChannelValidatorsAndInputFormatters();

  /// The default instance of [ValidatorsAndInputFormattersPlatform] to use.
  ///
  /// Defaults to [MethodChannelValidatorsAndInputFormatters].
  static ValidatorsAndInputFormattersPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ValidatorsAndInputFormattersPlatform] when
  /// they register themselves.
  static set instance(ValidatorsAndInputFormattersPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }


  /// this function can be used to get the platform version, if called then it will throw an error, so do not use it
  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
