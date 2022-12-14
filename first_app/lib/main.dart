import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/bloc/auth/auth_cubit.dart';
import 'package:first_app/bloc/post/post_cubit.dart';
import 'package:first_app/bloc/theme/theme_cubit.dart';
import 'package:first_app/screen/basics_widgets/splash_screen.dart';
import 'package:first_app/util/custom_theme.dart';
import 'package:first_app/util/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation/custom_route_generator.dart';

/// only one in a flutter project
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(OurApp()); // starts running our app
}

class OurApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// MaterialApp: only one in the whole app

    return Env(
      baseUrl: "this is the base url",
      apiKey: "this is the api key ",
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PostCubit>(create: (ctx) => PostCubit()..fetchPosts()),
          BlocProvider<AuthCubit>(create: (ctx) => AuthCubit()),
          BlocProvider<ThemeCubit>(
              create: (ctx) => ThemeCubit()..fetchInitialTheme())
        ],
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, state) {
            return MaterialApp(
              title: "Our app",
              theme: CustomTheme.lightTheme,
              darkTheme: CustomTheme.darkTheme,
              themeMode: state,
              home: SplashScreen(),
              // initialRoute: Routes.splash,
              onGenerateRoute: ourRouteGenerator,
            );
          },
        ),
      ),
    );
  }
}

/// MaterialApp : to provide the basic config of the appRowColumnScreen