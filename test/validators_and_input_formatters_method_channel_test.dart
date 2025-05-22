import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:validators_and_input_formatters/validators_and_input_formatters_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelValidatorsAndInputFormatters platform = MethodChannelValidatorsAndInputFormatters();
  const MethodChannel channel = MethodChannel('validators_and_input_formatters');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
