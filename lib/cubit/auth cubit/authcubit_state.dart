part of 'authcubit_cubit.dart';

abstract class AuthState {}

class AuthcubitInitial extends AuthState {}
class RegisterLoading extends AuthState {}
class RegisterSuccess extends AuthState {
  late bool status;
  late String message;
  String?token;

  RegisterSuccess({required this.status,required this.message, this.token});
}
class RegisterError extends AuthState {}


class LoginLoading extends AuthState {}
class LoginSuccess extends AuthState {
  late bool status;
  late String message;
  String?token;

  LoginSuccess({required this.status,required this.message, this.token});
}
class LoginError extends AuthState {}
