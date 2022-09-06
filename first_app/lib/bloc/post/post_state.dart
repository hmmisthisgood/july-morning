import '../../model/post.dart';

abstract class PostState {
  final List<Post> data;
  const PostState({this.data = const []});
}

// innit state

class PostInitial extends PostState {}

/// loading state
class PostLoading extends PostState {
  final String loadingMessage;

  PostLoading({required this.loadingMessage});
}

/// error state
class PostError extends PostState {
  final String errorMessage;

  PostError({required this.errorMessage});
}

/// success state
class PostFetchSuccess extends PostState {
  final List<Post> data;

  PostFetchSuccess({required this.data}) : super(data: data);
}

/// loading more data state

class PostLoadingMore extends PostState {
  final List<Post> data;

  PostLoadingMore({required this.data}) : super(data: data);
}

/// loading more error
class PostLoadingMoreError extends PostState {
  final List<Post> data;
  final String errorMessage;

  PostLoadingMoreError({required this.data, required this.errorMessage})
      : super(data: data);
}

/// loading more success

/// refreshing state
class PostRefreshing extends PostState {
  final List<Post> data;

  PostRefreshing({required this.data});
}


/// refreshing success
