import 'package:first_app/bloc/post/post_cubit.dart';
import 'package:first_app/bloc/post/post_state.dart';
import 'package:first_app/bloc/theme/theme_cubit.dart';
import 'package:first_app/util/custom_theme.dart';
import 'package:first_app/util/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../widget/ig_post_with_post_model.dart';

class PostScreenWithBloc extends StatefulWidget {
  const PostScreenWithBloc({Key? key, this.randomValue}) : super(key: key);
  final randomValue;
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

  askPermission() async {
    final bool isLocationPermissionGranted =
        await Permission.location.isGranted;

    if (isLocationPermissionGranted == false) {
      final status = await Permission.location.request();
      print(status);
    }
  }

  pickImage() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    final apiKey = Env.of(context).apiKey;
    print('api key from inherited widget is: $apiKey');

    final theme = Theme.of(context);
    final isDarkMode = CustomTheme.isDarkTheme(theme.scaffoldBackgroundColor);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                bool isDarkTheme =
                    CustomTheme.isDarkTheme(theme.scaffoldBackgroundColor);
                context.read<ThemeCubit>().toogleTheme(isDarkTheme);
              },
              icon: Icon(
                isDarkMode ? Icons.dark_mode : Icons.dark_mode_outlined,
                color: Colors.white,
                size: 35,
              )),
        ],
      ),
      body: Center(
        child: BlocBuilder<PostCubit, PostState>(builder: (context, state) {
          // initial or loading

          // print(state);

          if (state is PostInitial || state is PostLoading) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 10),
                if (state is PostLoading) Text(state.loadingMessage)
              ],
            );
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

                        return InkWell(
                          onTap: () {
                            askPermission();
                            pickImage();
                          },
                          child: IgPostWithModel(
                            postData: post,
                            randomValue: widget.randomValue,
                          ),
                        );
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
