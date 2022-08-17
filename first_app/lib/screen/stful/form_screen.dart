import 'package:first_app/screen/stful/bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../navigation/routes.dart';
import '../../widget/common_textfield.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  bool hidePassword = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("build form");
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: ListView(
            children: [
              /// without common textfield

              TextFormField(
                // maxLines: 5
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autofocus: false,
                onChanged: (val) {
                  print(val);
                },
                // onSubmitted: (val) {},

                autocorrect: false,
                validator: MultiValidator([
                  RequiredValidator(errorText: "Email is required"),
                  EmailValidator(errorText: "Email must be valid"),
                ]),

                //  (val) {
                //   /// error cases check

                //   if (val == null) {
                //     return "Email must not be empty";
                //   }

                //   if (!val.contains("@")) {
                //     return "Enter a valid email";
                //     // test@test.com
                //   }
                // },

                decoration: InputDecoration(
                  hintText: "Enter your email",
                  hintStyle: TextStyle(color: Colors.grey),
                  // enabled: false,
                  // fillColor: Colors.black,
                  labelText: "Email",

                  prefixIcon: Icon(Icons.email),

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.purple)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),

              TextFormField(
                controller: passwordController,
                validator: MultiValidator([
                  RequiredValidator(errorText: "Password is required"),
                  MinLengthValidator(8,
                      errorText: "Pasword must be at least 8 charcters long"),
                ]),
                obscureText: hidePassword,
                decoration: InputDecoration(
                  hintText: "Enter your pasword",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: InkWell(
                      onTap: () {
                        hidePassword = !hidePassword;
                        setState(() {});
                      },
                      child: Icon(Icons.visibility)),
                ),
              ),

              /// with common text field
              ///
              SizedBox(height: 15),

              Text("With common widgets"),
              SizedBox(height: 15),
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
                onPressed: () {
                  if (formKey.currentState != null) {
                    formKey.currentState!.save();

                    var isValid = formKey.currentState!.validate();

                    if (isValid == true) {
                      /// login logic
                    }

                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (c) => DashboardScreen()));

                    /// Push replacement:
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (c) => DashboardScreen()));

                    Navigator.pushReplacementNamed(context, Routes.dashboard);

                    /// push and remove until
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(builder: (c) => DashboardScreen()),
                    //     (route) => false);
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
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
