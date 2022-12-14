import 'dart:convert';

import 'package:http_app/bloc/post/post_state.dart';
import 'package:http/http.dart' as http;

import '../../model/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(InitialState());

  ///
  fetchPosts() async {
    print("fetchnig posts");
    final serverLocation = "https://jsonplaceholder.typicode.com/posts";
    final uri = Uri.parse(serverLocation);

    try {
      emit(LoadingState());

      final response = await http.get(uri);

      final List decoded = json.decode(response.body);

      final posts = decoded.map((e) => Post.convertJsonToPost(e)).toList();

      emit(PostFetchSuccessState(posts: posts));
    } catch (e) {
      print(e);
      emit(ErrorState(errorMessage: e.toString()));
    }
  }

  deletePost() {}
  updatePost() {}
}

/// Cubit
/// Bloc
/// Event
/// State
/// emit
