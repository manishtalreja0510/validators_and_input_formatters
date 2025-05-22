import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'validators_and_input_formatters_platform_interface.dart';

/// An implementation of [ValidatorsAndInputFormattersPlatform] that uses method channels.
class MethodChannelValidatorsAndInputFormatters
    extends ValidatorsAndInputFormattersPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('validators_and_input_formatters');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
