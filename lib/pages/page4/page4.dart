import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nepali_connect/api.dart';
import 'package:nepali_connect/pages/loginscreen/loginscreen.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    void logout() async {
      await dio.get(logoutUrl).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(value.data.toString()),
        ));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ));
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(error.response.toString()),
        ));
      });
    }

    return Center(
      child: MaterialButton(
        onPressed: () {
          logout();
        },
        textColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        color: Colors.green,
        child: const Text("LOG OUT"),
      ),
    );
  }
}
