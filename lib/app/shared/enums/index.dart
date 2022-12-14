enum AccountType { worker, employer }

extension LoginTypeExtension on AccountType {
  String get value {
    switch (this) {
      case AccountType.worker:
        return 'worker';
      case AccountType.employer:
        return 'employer';
      default:
        return '';
    }
  }
}
