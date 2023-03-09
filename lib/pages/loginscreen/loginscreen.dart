import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nepali_connect/api.dart';
import 'package:nepali_connect/flutter_secure_storage.dart';
import 'package:nepali_connect/jwt/jwt.dart';
import 'package:nepali_connect/model/access_token.dart';
import 'package:nepali_connect/widget/text_field.dart';
import 'package:nepali_connect/util/text_validator.dart';
import 'package:nepali_connect/pages/navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisiblePassword = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 30,
          ),
          Hero(
            tag: "logo",
            child: Image.asset(
              'assets/images/nepaliConnect.png',
              width: 200,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Welcome Back",
            style: TextStyle(fontSize: 38, fontWeight: FontWeight.w600),
          ),
          const Text(
            "Sign to continue",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w300, color: Colors.grey),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            hintText: "Email Address",
            prefixIcon: const Icon(Icons.account_box),
            validator: (value) {
              if (!value!.isValidEmail) {
                return "Invalid email";
              }
            },
            controller: usernameController,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
              hintText: "Password",
              prefixIcon: const Icon(Icons.password_outlined),
              isVisible: isVisiblePassword,
              validator: (value) {
                if (!value!.isValidPassword) {
                  return "Invalid Password";
                }
              },
              controller: passwordController,
              suffixIcon: IconButton(
                icon: isVisiblePassword
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                onPressed: () {
                  setState(() {
                    isVisiblePassword = !isVisiblePassword;
                  });
                },
              )),
          const Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                "forgot password?",
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 300,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                login();

                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                //   builder: (context) => const PageNavigator(),
                // ));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.w700)),
              child: const Text("Login"),
            ),
          )
        ]),
      ),
    );
  }

  void login() async {
    await dio.post(loginUrl, data: {
      "username": usernameController.text,
      "password": passwordController.text
    }).then((value) async {
      var accessToken = AccessToken.fromJson(value.data);
      await storage
          .write(
              key: "jwt",
              value: accessToken.tokenType + accessToken.accessToken)
          .then((value) {
        addHeader();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const PageNavigator(),
            ));
      });
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.response.toString()),
      ));
    });
  }
}
