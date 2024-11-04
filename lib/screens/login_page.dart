import 'package:flutter/material.dart';
import 'package:onemoney_hack/screens/login_dialog.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  final imgUrl =
      "https://c7.alamy.com/comp/MMDHB7/one-rural-villager-female-showing-indian-currency-banknotes-saving-farm-MMDHB7.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("images/wallpaper.jpg"),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 48,
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginDialog(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
