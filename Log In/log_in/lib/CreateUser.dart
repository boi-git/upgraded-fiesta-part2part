// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:log_in/LoginScreenPage.dart';
import 'package:provider/provider.dart';

import 'Services/Auth_Services.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: "Email",
            ),
          ),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(
              hintText: "Passowrd",
            ),
          ),
          TextFormField(
            controller: roleController,
            decoration: const InputDecoration(
              hintText: "Role",
            ),
          ),
          TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(
              hintText: "Matric Number",
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: const Color.fromARGB(255, 243, 160, 7),
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              onPressed: () async {
                String email = emailController.text.trim();
                String password = passwordController.text.trim();
                String role = roleController.text.trim();
                String username = usernameController.text.trim();

                context
                    .read<AuthService>()
                    .signUp(email, password, role, username);

                Navigator.of(context).pop(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: const Text(
                "Login",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
    );
  }
}
