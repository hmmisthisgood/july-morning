import 'package:first_app/bloc/post/post_cubit.dart';
import 'package:first_app/bloc/post/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../widget/ig_post_with_post_model.dart';

class PostScreenWithBloc extends StatelessWidget {
  const PostScreenWithBloc({Key? key}) : super(key: key);

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

          if (state is PostFetchSuccess) {
            return LazyLoadScrollView(
              onEndOfPage: () {
                print("I am at the endp");
              },
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    final post = state.data[index];

                    return IgPostWithModel(postData: post);
                  }),
            );
          }

          return Text("Unknown state");
        }),
      ),
    );
  }
}
