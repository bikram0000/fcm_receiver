import 'package:fcm_receiver_example/windows_notification_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('parseNotification', () {
    test('reads title and body from a standard FCM display payload', () {
      // Shape captured from a real decrypted FCM push. The sender id has been
      // replaced so no project detail is baked into the test data.
      final result = WindowsNotificationService.parseNotification(
        '{"from":"000000000000","fcmMessageId":"4b78b43c-03da-417e-8280-c114c313bc44",'
        '"data":{"source":"send_push.sh"},"priority":"high",'
        '"notification":{"body":"from send_push.sh","title":"Tool test"}}',
      );

      expect(result.title, 'Tool test');
      expect(result.body, 'from send_push.sh');
      // An id is what lets a repeat replace the earlier toast.
      expect(result.id, isNonNegative);
    });

    test('falls back to data map keys for data-only pushes', () {
      final result = WindowsNotificationService.parseNotification(
        '{"data":{"title":"Order shipped","body":"Arrives Tuesday"}}',
      );

      expect(result.title, 'Order shipped');
      expect(result.body, 'Arrives Tuesday');
    });

    test('reads title and body from an aps alert payload', () {
      final result = WindowsNotificationService.parseNotification(
        '{"aps":{"alert":{"title":"Heads up","body":"Something happened"}}}',
      );

      expect(result.title, 'Heads up');
      expect(result.body, 'Something happened');
    });

    test('handles a plain string aps alert', () {
      final result = WindowsNotificationService.parseNotification(
          '{"aps":{"alert":"Wake up"}}');

      expect(result.body, 'Wake up');
    });

    test('uses a default title when the payload has none', () {
      final result = WindowsNotificationService.parseNotification(
          '{"data":{"body":"Just a body"}}');

      expect(result.title, 'New push notification');
      expect(result.body, 'Just a body');
    });

    test('shows the raw text when the payload is not JSON', () {
      final result =
          WindowsNotificationService.parseNotification('hello there');

      expect(result.title, 'New push notification');
      expect(result.body, 'hello there');
    });

    test('never returns an empty body', () {
      final result = WindowsNotificationService.parseNotification('');

      expect(result.body, isNotEmpty);
    });

    test('truncates an extremely long body', () {
      final result = WindowsNotificationService.parseNotification(
        '{"notification":{"title":"t","body":"${'x' * 2000}"}}',
      );

      expect(result.body.length, lessThanOrEqualTo(401));
      expect(result.body, endsWith('…'));
    });

    test('is stable for the same message so taps match the list', () {
      const payload = '{"notification":{"title":"t","body":"b"}}';
      expect(WindowsNotificationService.parseNotification(payload).id,
          WindowsNotificationService.parseNotification(payload).id);
    });
  });

  group('parseActivation', () {
    test('round-trips the payload written by parseNotification', () {
      final notification = WindowsNotificationService.parseNotification(
        '{"notification":{"title":"Tool test","body":"hello world"}}',
      );
      final payload =
          '{"id":${notification.id},"title":"${notification.title}",'
          '"body":"${notification.body}"}';

      final activated = WindowsNotificationService.parseActivation(payload);

      expect(activated, isNotNull);
      expect(activated!.id, notification.id);
      expect(activated.title, 'Tool test');
      expect(activated.body, 'hello world');
    });

    test('returns null for the command-line activation flag', () {
      // The cold-start flag carries no content; the real payload arrives via
      // getNotificationAppLaunchDetails instead.
      expect(WindowsNotificationService.parseActivation('-ToastActivated'),
          isNull);
    });

    test('returns null for an empty payload', () {
      expect(WindowsNotificationService.parseActivation(null), isNull);
      expect(WindowsNotificationService.parseActivation(''), isNull);
    });

    test('falls back to treating plain text as the body', () {
      final activated = WindowsNotificationService.parseActivation('hello');

      expect(activated!.body, 'hello');
      expect(activated.id, isNull);
    });

    test('survives a payload missing its fields', () {
      final activated = WindowsNotificationService.parseActivation('{}');

      expect(activated!.title, 'Push notification');
      expect(activated.body, isEmpty);
      expect(activated.id, isNull);
    });
  });

  group('consumeStartupArguments', () {
    test('detects the toast activation flag case-insensitively', () {
      final result = WindowsNotificationService.consumeStartupArguments(
          ['C:\\app.exe', '-toastactivated']);

      expect(result, WindowsNotificationService.toastActivatedArg);
    });

    test('returns null for a normal launch', () {
      expect(
          WindowsNotificationService.consumeStartupArguments(['C:\\app.exe']),
          isNull);
    });
  });
}
