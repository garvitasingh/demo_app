import 'package:demo_app/utils/colors.dart';
import 'package:demo_app/view/widgets/custom_button_widget.dart';
import 'package:demo_app/view/widgets/custom_textfield_widget.dart';
import 'package:demo_app/view/widgets/gradient_circle_widget.dart';
import 'package:demo_app/view/widgets/socialmedia_icon_widget.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        child: Stack(
          // clipBehavior: Clip.none,
          children: [
            // SizedBox(height: h,),
            Container(
              height: h * 0.4,
              decoration: BoxDecoration(gradient: AppColors.linearGradient),
            ),
            Positioned(
                left: -w,
                right: 0,
                top: h * 0.1,
                child: GradientCircleWidget(height: h * 0.2)),
            Positioned(
                left: w * 0.82,
                right: -h * 0.05,
                top: -h * 0.025,
                child: GradientCircleWidget(height: h * 0.12)),
            Positioned(
              top: h * 0.13,
              left: 0,
              right: 0,
              child: Text(
                "Sign Up",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
            Positioned(
              top: h*0.06,
                left: 10,
                // right: 0,
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
              icon: Icon(Icons.arrow_back,
              size: 35,),
            )),
            Positioned(
                top: h * 0.2,
                left: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.all(15),
                  height: h * 0.7,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.boxShadow,
                            blurRadius: 10,
                            spreadRadius: 6,
                            offset: Offset(0, 5))
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: h*0.05,),
                      CustomTextFieldWidget(
                          icon: Icons.account_circle_outlined, hintText: "Full Name"),
                      CustomTextFieldWidget(
                          icon: Icons.email_outlined, hintText: "Email"),
                      CustomTextFieldWidget(
                          icon: Icons.lock_outline, hintText: "Password"),
                      CustomTextFieldWidget(
                          icon: Icons.lock_outline, hintText: "Confirm Password"),
                      // SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'I agree with the ',
                                  style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.w500),
                                ),
                                TextSpan(
                                  text: 'Terms & Conditions',
                                  style: TextStyle(color: Colors.red,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:  30,),
                      CustomButtonWidget(text: "Sign up"),
                      SizedBox(height:  20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialMediaIconWidget(icon: Icons.g_mobiledata,color: Colors.red,),
                          SocialMediaIconWidget(icon: Icons.facebook,color: Colors.blue,),
                          SocialMediaIconWidget(icon: Icons.apple,color: Colors.black,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),),
                          Text("  log in",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.lightBlue,
                                fontSize: 18
                            ),),
                        ],
                      )
                    ],
                  ),
                )),
            Positioned(
                left: w * 0.7,
                right: w * 0.1,
                top: h * 0.18,
                child: GradientCircleWidget(height: h * 0.08)),
          ],
        ),
      ),
    );
  }
}
