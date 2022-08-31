import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/util/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../navigation/routes.dart';
import '../../widget/common_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, this.pageTitle = "login"}) : super(key: key);
  final String pageTitle;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  navigate() async {
    Navigator.pushReplacementNamed(
      context,
      Routes.dashboard,
      arguments: {"username": "thisIsRamey", "seconArg": "some other stuff"},
    );
  }

  loginWithFirebase() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      print(credential.toString());
      Fluttertoast.showToast(msg: "Login Successful!!!!");

      await SharedPref.setHasUserLoggedIn(true);
      navigate();
    } on FirebaseAuthException catch (e) {
      print(e.message);
      print(e.code);
      Fluttertoast.showToast(
          msg: e.message ?? "An error occurred while signing in");
    } catch (e) {
      print(e);
    }
  }

  void login() async {
    if (formKey.currentState != null) {
      formKey.currentState!.save();
      var isValid = formKey.currentState!.validate();
      if (isValid == true) {
        /// login logic
        FocusScope.of(context).unfocus();
        loginWithFirebase();
      }
    }
  }

  signInWithGoogle() async {
    print(FirebaseAuth.instance.currentUser.toString());
    print("----------------");

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

      navigate();
      print(successCredential.toString());
    } on FirebaseAuthException catch (e) {
      print(e.message);
    } catch (e) {
      print(e.toString());
    }
  }

  signInWithFacebook() async {
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
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build form");
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: ListView(
            children: [
              /// with common text field
              ///

              CommonTextField(
                controller: emailController,
                hintText: "Enter your email",
                textInputAction: TextInputAction.done,
                prefixIcon: Icon(Icons.email),
                validator: MultiValidator([
                  RequiredValidator(errorText: "Email is required"),
                  EmailValidator(errorText: "Email must be valid"),
                ]),
              ),

              CommonTextField(
                controller: passwordController,
                hintText: "Enter your password",
                textInputAction: TextInputAction.done,
                prefixIcon: Icon(Icons.lock),
                obscureText: hidePassword,
                sufficIcon: InkWell(
                    onTap: () {
                      hidePassword = !hidePassword;
                      setState(() {});
                    },
                    child: Icon(hidePassword == true
                        ? Icons.visibility
                        : Icons.visibility_off)),
                validator: MultiValidator([
                  RequiredValidator(errorText: "Password is required"),
                  MinLengthValidator(8,
                      errorText: "Pasword must be at least 8 charcters long"),
                ]),
              ),

              MaterialButton(
                color: Colors.blue,
                onPressed: login,
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              SizedBox(height: 12),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.signup);
                },
                child: Text(
                  "Don't have an account? Sign Up",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),

              MaterialButton(
                onPressed: signInWithGoogle,
                color: Colors.red,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset(
                    'assets/icons/google.png',
                    height: 30,
                    width: 30,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Sign In With Google",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                ]),
              ),
              MaterialButton(
                color: Color(0xff4267B2),
                onPressed: signInWithFacebook,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset(
                    'assets/icons/facebook.png',
                    height: 25,
                    width: 30,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Sign In With Facebook",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// Form  : not visible in ui
/// TextField : each input field
/// TextFormField : like textfield
