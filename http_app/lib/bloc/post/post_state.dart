import '../../model/post.dart';

abstract class PostState {}

class InitialState extends PostState {}

class LoadingState extends PostState {}

class ErrorState extends PostState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}

class PostFetchSuccessState extends PostState {
  final List<Post> posts;
  PostFetchSuccessState({required this.posts});
}
