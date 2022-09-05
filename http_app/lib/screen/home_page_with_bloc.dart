import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http_app/bloc/post/post_state.dart';

import '../bloc/post/post_cubit.dart';
import '../widget/posts_list_widget.dart';

class HomepageWithBloc extends StatefulWidget {
  HomepageWithBloc({Key? key}) : super(key: key);

  @override
  State<HomepageWithBloc> createState() => _HomepageWithBlocState();
}

class _HomepageWithBlocState extends State<HomepageWithBloc> {
  final postsBloc = PostCubit();
  final postBloc2 = PostCubit();

  @override
  void initState() {
    super.initState();

    /// 1. can do this way to get the provided bloc's instance
    BlocProvider.of<PostCubit>(context).fetchPosts();

    /// OR this

    // context.read<PostCubit>().fetchPosts();
  }

  navigate() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => Scaffold(appBar: AppBar())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PostCubit, PostState>(
        // bloc: postsBloc,
        listener: (context, state) {
          if (state is PostFetchSuccessState) {
            Fluttertoast.showToast(
              msg: "Data fetched success!!!!",
              toastLength: Toast.LENGTH_LONG,
            );
            navigate();
          }
        },
        builder: (context, state) {
          /// inital or loading state

          print(state);

          if (state is LoadingState || state is InitialState) {
            return CircularProgressIndicator();
          }

          /// error state

          if (state is ErrorState) {
            return Center(child: Text(state.errorMessage));
          }

          /// succsss state

          if (state is PostFetchSuccessState) {
            return PostListWidget(posts: state.posts);
          }

          return Text("Unknown state: ");
        },
      ),
    );
  }
}

/// Widgets fro bloc:
/// 1. BlocBuilder = listens for the bloc/cubit's states and can build UI after that.
/// 2. BlocListener =listens for bloc/cubit's states aand can perofm some side effect actions
/// 3. BlocConsumer (Combo of builder and listener)

/// 4. BlocProvider: Very important widget : distributes the bloc
