import 'package:dio/dio.dart';
import 'package:first_app/bloc/post/post_state.dart';
import 'package:first_app/repository/post_repository.dart';
import 'package:first_app/util/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/post.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());
  Dio _dio = Dio();

  int total = 0;
  int currentPage = 1;
  List<Post> allPosts = [];

  // PostRepository repository;

  fetchPosts() async {
    final url = "https://pixabay.com/api";

    // repository.fetchSomeData();

    try {
      emit(PostLoading(loadingMessage: "Loading..."));

      final response = await _dio.get(url, queryParameters: {
        "key": Str.apiKey,
        "page": 1,
        "per_page": 5,
        "q": "car"
      });
      print(response.statusCode);

      /// in Dio you do not need to user json.decode on response
      final body = response.data; // same as response.body in http pacakge

      total = body['total'];
      final List hits = body['hits'];

      final List<Post> posts = hits.map((e) => Post.fromJson(e)).toList();
      allPosts.addAll(posts);

      // emit(PostLoading(loadingMessage: "Fetching data"));

      emit(PostFetchSuccess(data: posts));
    } catch (e) {
      print(e);
      emit(PostError(errorMessage: e.toString()));
    }
  }

  loadMorePosts() async {
    final url = "https://pixabay.com/api";

    currentPage++;

    try {
      emit(PostLoadingMore(data: allPosts));
      final response = await _dio.get(url, queryParameters: {
        "key": Str.apiKey,
        "page": currentPage, // 2
        "per_page": 5,
        "q": "car"
      });
      print(response.statusCode);

      /// in Dio you do not need to user json.decode on response
      final body = response.data; // same as response.body in http pacakge

      total = body['total'];
      final List hits = body['hits'];

      final List<Post> temp = hits.map((e) => Post.fromJson(e)).toList();
      allPosts.addAll(temp);

      emit(PostFetchSuccess(data: allPosts));
    } catch (e) {
      print(e);
      emit(PostError(errorMessage: e.toString()));
    }
  }

  refreshPosts() {}
}
