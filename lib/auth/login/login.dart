import 'package:carebridge/controllers/auth_controller.dart';
import 'package:carebridge/utils/utils.dart';
import 'package:carebridge/home/homepage.dart';
import 'package:carebridge/utils/validator/validator.dart';
import 'package:carebridge/widgets/customElevatedButton/custom_elevated_button.dart';
import 'package:carebridge/widgets/customTextButton/custom_text_button.dart';
import 'package:carebridge/widgets/customTextField/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  FirebaseAuth _auth = FirebaseAuth.instance;
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
    var controller = Get.put(AuthController());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width,
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        alignment: Alignment.topLeft,
                        child: Text("Login", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                      SizedBox(height: height*0.04,),
                      CustomTextField(
                        controller: controller.emailController,
                        label: "Email",
                        validator: Validator.isEmailValid,
                        prefixIcon: Icons.email
                      ),
                      SizedBox(height: height*0.04,),
                      CustomTextField(
                        controller: controller.passwordController,
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
                        onPressed: () async{
                          controller.login(context);
                          
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
      ),
    );
  }
}
