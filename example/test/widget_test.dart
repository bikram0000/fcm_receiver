import 'package:fcm_receiver/messaging_utility.dart';
import 'package:fcm_receiver_example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Dashboard shows its initial state', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Overview'), findsOneWidget);
    expect(find.text('Device token'), findsOneWidget);
    expect(find.text('Waiting for a device token…'), findsOneWidget);
    expect(find.text('Recent messages'), findsOneWidget);
    expect(find.text('No messages yet'), findsOneWidget);
  });

  testWidgets('Copy token shows confirmation without a messenger error',
      (WidgetTester tester) async {
    String? copiedToken;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(SystemChannels.platform, (call) async {
      if (call.method == 'Clipboard.setData') {
        copiedToken = (call.arguments as Map)['text'] as String?;
      }
      return null;
    });
    addTearDown(() => TestDefaultBinaryMessengerBinding
        .instance.defaultBinaryMessenger
        .setMockMethodCallHandler(SystemChannels.platform, null));
    await tester.pumpWidget(const MyApp());
    MessagingUtility.instance.onTokenRefresh?.call('test-device-token');
    await tester.pump();

    final copyButton = find.widgetWithText(FilledButton, 'Copy token');
    await tester.ensureVisible(copyButton);
    await tester.pump();
    await tester.tap(copyButton);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(copiedToken, 'test-device-token');
    expect(find.text('FCM token copied to clipboard'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
