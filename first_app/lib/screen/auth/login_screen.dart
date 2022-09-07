import 'package:first_app/bloc/auth/auth_cubit.dart';
import 'package:first_app/bloc/auth/auth_state.dart';
import 'package:first_app/screen/bloc_screens/posts_screen_with_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../navigation/routes.dart';
import '../../widget/common_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, this.pageTitle = "login", this.randomValue})
      : super(key: key);
  final String pageTitle;
  final randomValue;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  navigate() async {
    // Navigator.pushReplacementNamed(
    //   context,
    //   Routes.dashboard,
    //   arguments: {"username": "thisIsRamey", "seconArg": "some other stuff"},
    // );
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => PostScreenWithBloc(
                  randomValue: widget.randomValue,
                )));
  }

  void login() async {
    if (formKey.currentState != null) {
      formKey.currentState!.save();
      var isValid = formKey.currentState!.validate();
      if (isValid == true) {
        /// login logic
        FocusScope.of(context).unfocus();
        context
            .read<AuthCubit>()
            .loginWithFirebase(emailController.text, passwordController.text);
      }
    }
  }

  void signInWithGoogle() {
    context.read<AuthCubit>().signInWithGoogle();
  }

  void signInWithFacebook() {
    context.read<AuthCubit>().signInWithFacebook();
  }

  @override
  Widget build(BuildContext context) {
    print("build form");
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
        automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            navigate();
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Padding(
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
                              errorText:
                                  "Pasword must be at least 8 charcters long"),
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
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),

                      MaterialButton(
                        onPressed: signInWithGoogle,
                        color: Colors.red,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/google.png',
                                height: 30,
                                width: 30,
                                color: Colors.white,
                              ),
                              SizedBox(width: 20),
                              Text(
                                "Sign In With Google",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )
                            ]),
                      ),
                      MaterialButton(
                        color: Color(0xff4267B2),
                        onPressed: signInWithFacebook,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/facebook.png',
                                height: 25,
                                width: 30,
                                color: Colors.white,
                              ),
                              SizedBox(width: 20),
                              Text(
                                "Sign In With Facebook",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )
                            ]),
                      )
                    ],
                  ),
                ),
              ),
              if (state is AuthLoading)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(child: CircularProgressIndicator()),
                )
            ],
          );
        },
      ),
    );
  }
}

/// Form  : not visible in ui
/// TextField : each input field
/// TextFormField : like textfield
