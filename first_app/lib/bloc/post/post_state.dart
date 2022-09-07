import 'package:equatable/equatable.dart';

import '../../model/post.dart';

abstract class PostState extends Equatable {
  final List<Post> data;
  const PostState({this.data = const []});
}

// innit state

class PostInitial extends PostState {
  @override
  List<Object?> get props => [];
}

/// loading state
class PostLoading extends PostState {
  final String loadingMessage;

  PostLoading({required this.loadingMessage});

  @override
  List<Object?> get props => [loadingMessage];
}

/// error state
class PostError extends PostState {
  final String errorMessage;

  PostError({required this.errorMessage});
  List<Object?> get props => [errorMessage];
}

/// success state
class PostFetchSuccess extends PostState {
  final List<Post> data;

  PostFetchSuccess({required this.data}) : super(data: data);
  List<Object?> get props => [...data];
}

/// loading more data state

class PostLoadingMore extends PostState {
  final List<Post> data;

  PostLoadingMore({required this.data}) : super(data: data);

  @override
  List<Object?> get props => [...data];
}

/// loading more error
class PostLoadingMoreError extends PostState {
  final List<Post> data;
  final String errorMessage;

  PostLoadingMoreError({required this.data, required this.errorMessage})
      : super(data: data);
  @override
  List<Object?> get props => [...data];
}

/// loading more success

/// refreshing state
class PostRefreshing extends PostState {
  final List<Post> data;

  PostRefreshing({required this.data});

  @override
  List<Object?> get props => [...data];
}

/// refreshing success
