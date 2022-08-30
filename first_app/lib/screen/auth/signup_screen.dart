import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/screen/stful/bottom_nav_screen.dart';
import 'package:first_app/util/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../navigation/routes.dart';
import '../../widget/common_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key, this.pageTitle = "login"}) : super(key: key);
  final String pageTitle;

  @override
  State<SignupScreen> createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  bool hidePassword = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  createUserWithFirebase() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      print(credential.toString());
      Fluttertoast.showToast(msg: "Succesfully signed up!!. You can login now");
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      print(e.code);
      Fluttertoast.showToast(
          msg: e.message ?? "An error occurred while signing up");
    } catch (e) {
      print(e);
    }
  }

  signUp() async {
    if (formKey.currentState != null) {
      formKey.currentState!.save();

      var isValid = formKey.currentState!.validate();
      if (isValid == true) {
        //
        /// unfocuses and removes the keyboard
        FocusScope.of(context).unfocus();
        createUserWithFirebase();

        /// login logic
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build form");
    return Scaffold(
      appBar: AppBar(title: Text("Sign up")),
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
                  onPressed: signUp,
                  child:
                      Text("Register", style: TextStyle(color: Colors.white)))
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
