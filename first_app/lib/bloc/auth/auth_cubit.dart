import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/bloc/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../util/shared_pref.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  loginWithFirebase(String email, String password) async {
    emit(AuthLoading(loadingMessage: "Singning in. Please wait"));
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print(credential.toString());
      Fluttertoast.showToast(msg: "Login Successful!!!!");

      await SharedPref.setHasUserLoggedIn(true);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      print(e.message);
      print(e.code);

      Fluttertoast.showToast(
          msg: e.message ?? "An error occurred while signing in");

      emit(AuthError(
          errorMessage: e.message ?? "An error occurred while signing in"));
    } catch (e) {
      print(e);
      emit(AuthError(errorMessage: "An error occurred"));
    }
  }

  signInWithGoogle() async {
    emit(AuthLoading(loadingMessage: "Singning in with Google"));

    try {
      final google = GoogleSignIn();
      await GoogleSignIn().signOut();

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await google.signIn();

      if (googleUser == null) {
        print("login cancelld or error in login");
        return;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      print(googleAuth.accessToken);

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      final successCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      print(successCredential.toString());
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      print(e.message);
      emit(AuthError(
          errorMessage: e.message ?? "An error occurred while signing in"));
    } catch (e) {
      print(e.toString());
      emit(AuthError(errorMessage: "An error occurred"));
    }
  }

  signInWithFacebook() async {
    emit(AuthLoading(loadingMessage: "Singning in with Facebook"));

    final loginResult = await FacebookAuth.instance.login();

    final status = loginResult.status;
    if (status == LoginStatus.cancelled) {
      print("Login cancelled");
      Fluttertoast.showToast(msg: "Login cancelled by user");
    }
    if (status == LoginStatus.failed) {
      print("An error occurred");
      Fluttertoast.showToast(msg: loginResult.message ?? "");
    }

    if (status == LoginStatus.success) {
      final AccessToken accessToken = loginResult.accessToken!;

      final OAuthCredential credential =
          FacebookAuthProvider.credential(accessToken.token);

      try {
        final successCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        print(successCredential.toString());
        Fluttertoast.showToast(msg: "Facebook login successful");
        emit(AuthSuccess());
      } catch (e) {
        print(e);
        emit(AuthError(errorMessage: "An error occurred"));
      }
    }
  }
}
