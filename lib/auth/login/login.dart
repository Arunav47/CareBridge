import 'package:carebridge/home/homepage.dart';
import 'package:carebridge/utils/validator/validator.dart';
import 'package:carebridge/widgets/customElevatedButton/custom_elevated_button.dart';
import 'package:carebridge/widgets/customTextButton/custom_text_button.dart';
import 'package:carebridge/widgets/customTextField/custom_text_field.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final void Function() onTapSignUp;
  const Login({
    super.key,
    required this.onTapSignUp
    });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width,
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextField(
                      controller: _emailController,
                      label: "Email",
                      validator: Validator.isEmailValid,
                      prefixIcon: Icons.email
                    ),
                    SizedBox(height: height*0.04,),
                    CustomTextField(
                      controller: _passwordController,
                      label: "Password",
                      validator: Validator.isPasswordValid,
                      prefixIcon: Icons.lock,
                      obscureText: obscurePassword,
                      onSecretChangeButtonPressed: (wasObscurePassword) {
                        setState(() {
                          obscurePassword = !wasObscurePassword;
                        });
                      },
                    ),
                    SizedBox(height: height*0.04,),
                    CustomElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageScreen()));
                      }, 
                      child: const Text("Login"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an Account?"),
                        CustomTextButton(
                          onPressed: (){
                            widget.onTapSignUp();
                          }, 
                          child: const Text("Sign Up"))
                      ],
                    )
                    
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
