import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  bool hidePassword = true;
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("build form");
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              // maxLines: 5
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,

              onChanged: (val) {
                print(val);
              },
              onSubmitted: (val) {},

              autocorrect: false,

              decoration: InputDecoration(
                hintText: "Enter your email",
                hintStyle: TextStyle(color: Colors.grey),
                // enabled: false,
                // fillColor: Colors.black,
                labelText: "Email",

                prefixIcon: Icon(Icons.email),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
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
            TextField(
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
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                // emailController.clear();

                final email = emailController.text;

                print("email is $email");
              },
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}


/// Form  : not visible in ui
/// TextField : each input field 
/// TextFormField : like textfield