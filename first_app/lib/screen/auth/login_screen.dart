import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/util/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

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
