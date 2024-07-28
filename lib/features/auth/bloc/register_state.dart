part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class RegisterLoadingState extends RegisterState {}
final class RegisterPickLocationState extends RegisterState {
  final GeoPoint location;
  RegisterPickLocationState({required this.location});
}
final class RegisterVerifiedState extends RegisterState {}
final class RegisterErrorState extends RegisterState {}
