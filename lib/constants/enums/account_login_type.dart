enum AccountLoginType {
  facebook,
  google,
  apple,
  email,
}

extension AccountLoginTypeX on AccountLoginType {
  static final List<String> _apiEndpoints = [
    'facebook',
    'google',
    'apple',
    'email',
  ];

  String get apiEndpoint => _apiEndpoints[index];
}
