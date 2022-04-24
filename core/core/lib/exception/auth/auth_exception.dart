abstract class AuthException implements Exception {}

class EmailInUseException extends AuthException {}

class WrongCredentialsException extends AuthException {}

class UnauthorizedException extends AuthException {}