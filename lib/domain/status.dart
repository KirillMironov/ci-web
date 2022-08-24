enum Status {
  success,
  failure,
  skipped,
  inProgress;

  static const Map<Status, String> toMap = {
    Status.success: 'success',
    Status.failure: 'failure',
    Status.skipped: 'skipped',
    Status.inProgress: 'in progress',
  };

  static const Map<String, Status> fromMap = {
    'success': Status.success,
    'failure': Status.failure,
    'skipped': Status.skipped,
    'in progress': Status.inProgress,
  };

  name() => toMap[this];

  factory Status.fromString(String value) {
    return fromMap[value] ?? (throw ArgumentError('Unknown status: $value'));
  }
}
