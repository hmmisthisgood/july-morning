import 'package:dio/dio.dart';
import 'package:first_app/bloc/post/post_state.dart';
import 'package:first_app/util/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/post.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());
  Dio _dio = Dio();

  int total = 0;

  fetchPosts() async {
    final url = "https://pixabay.com/api";

    try {
      emit(PostLoading(loadingMessage: ""));
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

      emit(PostFetchSuccess(data: posts));
    } catch (e) {
      print(e);
      emit(PostError(errorMessage: e.toString()));
    }
  }

  loadMorePosts() {}

  refreshPosts() {}
}
