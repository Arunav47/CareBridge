import 'package:carebridge/controllers/auth_controller.dart';
import 'package:carebridge/home/homepage.dart';
import 'package:carebridge/utils/validator/validator.dart';
import 'package:carebridge/widgets/customElevatedButton/custom_elevated_button.dart';
import 'package:carebridge/widgets/customTextButton/custom_text_button.dart';
import 'package:carebridge/widgets/customTextField/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  final void Function() onTapSignUp;
  const SignUp({
    super.key,
    required this.onTapSignUp  
  });

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Container(
              width: width,
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        alignment: Alignment.topLeft,
                        child: Text("Sign Up", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                      SizedBox(height: height*0.04,),
                      CustomTextField(
                        controller: controller.fullNameController,
                        label: "Full Name",
                        validator: Validator.isEmpty,
                        prefixIcon: Icons.person
                      ),
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
                          if(formKey.currentState!.validate()) {
                            controller.signupUser();
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePageScreen()));
                          }
                          }, 
                        child: const Text("Sign Up"),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?"),
                            CustomTextButton(
                              onPressed: (){
                                widget.onTapSignUp();
                              }, 
                              child: const Text("Login"))
                          ],
                        ),
                      )
                      
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
