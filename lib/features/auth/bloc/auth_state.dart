part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthErrorSendSmsState extends AuthState {}

final class AuthSendSmsState extends AuthState {}

final class AuthUserRegisteredState extends AuthState {}

final class AuthUserNotRegisteredState extends AuthState {}

final class AuthVerifiedState extends AuthState {}
