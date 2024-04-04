import 'package:carebridge/auth/login/login.dart';
import 'package:carebridge/auth/signup/signup.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Expanded(
          child: Container(
              width: width,
              color: Theme.of(context).scaffoldBackgroundColor,
              height: height*0.3,
              child: Image(image: AssetImage('assets/logo.png'),),
            ),
        ),
        Expanded(
          flex: 2,
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      children: [
        Container(
          height: height*0.7,
          color: Theme.of(context).scaffoldBackgroundColor,
          width: width,
        ),
        Login(
          onTapSignUp: () {
            pageController.animateToPage(
              2,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInBack,
            );
          },
        ),
        SignUp(
          onTapSignUp: () {
            pageController.animateToPage(
              1,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInBack,
            );
          },
        ),
        Container(
          height: height*0.7,
          color: Theme.of(context).scaffoldBackgroundColor,
          width: width,
        ),
      ],
    )
        
        )
      ],
    );
  }
}
