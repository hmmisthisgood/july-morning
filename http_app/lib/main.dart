import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_app/bloc/post/post_cubit.dart';
import 'package:http_app/screen/home_page_with_bloc.dart';

import 'screen/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => new PostCubit(),
      child: MaterialApp(
        home: HomepageWithBloc(),
      ),
    );
  }
}
