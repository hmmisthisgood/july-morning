abstract class AuthState {}

// innit state

class AuthInitial extends AuthState {}

/// loading state
class AuthLoading extends AuthState {
  final String loadingMessage;

  AuthLoading({required this.loadingMessage});
}

/// error state
class AuthError extends AuthState {
  final String errorMessage;

  AuthError({required this.errorMessage});
}

/// success state
class AuthSuccess extends AuthState {}
