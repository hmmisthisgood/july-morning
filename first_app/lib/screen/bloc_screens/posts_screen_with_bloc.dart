import 'package:first_app/bloc/post/post_cubit.dart';
import 'package:first_app/bloc/post/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../widget/ig_post_with_post_model.dart';

class PostScreenWithBloc extends StatefulWidget {
  const PostScreenWithBloc({Key? key}) : super(key: key);

  @override
  State<PostScreenWithBloc> createState() => _PostScreenWithBlocState();
}

class _PostScreenWithBlocState extends State<PostScreenWithBloc> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();

    controller.addListener(listener);
  }

  listener() {
    final position = controller.position;

    // print("max:${position.maxScrollExtent}");
    // print("min:${position.minScrollExtent}");

    print(position.pixels);

    if (position.pixels >= position.maxScrollExtent && position.atEdge) {
      print("I am at bottom");
      context.read<PostCubit>().loadMorePosts();
    }

    if (position.pixels <= position.minScrollExtent && position.atEdge) {
      print("I am at top");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<PostCubit, PostState>(builder: (context, state) {
          // initial or loading

          if (state is PostInitial || state is PostLoading) {
            return CircularProgressIndicator();
          }

          /// error
          if (state is PostError) {
            return Text(state.errorMessage);
          }

          if (state is PostFetchSuccess || state is PostLoadingMore) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      controller: controller,
                      // physics: BouncingScrollPhysics(),
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        final post = state.data[index];

                        return IgPostWithModel(postData: post);
                      }),
                ),
                if (state is PostLoadingMore) CircularProgressIndicator()
              ],
            );
          }

          return Text("Unknown state");
        }),
      ),
    );
  }
}
