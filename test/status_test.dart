import 'package:ci_web/domain/status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('status conversion', () {
    test('name', () {
      expect(Status.success.name(), 'success');
      expect(Status.failure.name(), 'failure');
      expect(Status.skipped.name(), 'skipped');
      expect(Status.inProgress.name(), 'in progress');
    });

    test('fromString', () {
      expect(Status.fromString('success'), Status.success);
      expect(Status.fromString('failure'), Status.failure);
      expect(Status.fromString('skipped'), Status.skipped);
      expect(Status.fromString('in progress'), Status.inProgress);

      expect(() => Status.fromString('-'), throwsA(isA<ArgumentError>()));
    });
  });
}
