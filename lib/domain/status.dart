enum Status {
  success,
  failure,
  skipped,
  inProgress;

  name() => {
        Status.success: 'success',
        Status.failure: 'failure',
        Status.skipped: 'skipped',
        Status.inProgress: 'in progress',
      }[this];

  factory Status.fromString(String str) => {
        'success': Status.success,
        'failure': Status.failure,
        'skipped': Status.skipped,
        'in progress': Status.inProgress,
      }[str] ??= (throw ArgumentError('Unknown status: $str'));
}
