part of 'register_form_cubit.dart';

sealed class RegisterFormState {}

class RegisterFormStateInitial extends RegisterFormState {}

class RegisterFormStateLoading extends RegisterFormState {}

class RegisterFormStateError extends RegisterFormState {
  final String message;
  RegisterFormStateError(this.message);
}

class RegisterFormStateSuccess extends RegisterFormState {}


