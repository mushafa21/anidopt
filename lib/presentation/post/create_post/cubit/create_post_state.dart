part of 'create_post_cubit.dart';

sealed class CreatePostState {}

class CreatePostStateInitial extends CreatePostState {}

class CreatePostStateLoading extends CreatePostState {}

class CreatePostStateError extends CreatePostState {
  final String message;
  CreatePostStateError(this.message);
}

class CreatePostStateSuccess extends CreatePostState {}

