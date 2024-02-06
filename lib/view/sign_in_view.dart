import 'package:demo_app/utils/colors.dart';
import 'package:demo_app/view/sign_up_view.dart';
import 'package:demo_app/view/widgets/custom_button_widget.dart';
import 'package:demo_app/view/widgets/custom_textfield_widget.dart';
import 'package:demo_app/view/widgets/gradient_circle_widget.dart';
import 'package:demo_app/view/widgets/socialmedia_icon_widget.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

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
                "Sign In",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
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
                      SizedBox(height: h*0.15,),
                      CustomTextFieldWidget(
                          icon: Icons.email_outlined, hintText: "Email"),
                      CustomTextFieldWidget(
                          icon: Icons.lock_outline, hintText: "Password"),
                      SizedBox(height: 15,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text("Forgot password ?",
                        // textAlign: TextAlign.right,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),),
                      ),
                      SizedBox(height:  60,),
                      CustomButtonWidget(text: "Sign in"),
                      SizedBox(height:  20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialMediaIconWidget(icon: Icons.g_mobiledata,color: Colors.red,),
                          SocialMediaIconWidget(icon: Icons.facebook,color: Colors.blue,),
                          SocialMediaIconWidget(icon: Icons.apple,color: Colors.black,),
                        ],
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpView()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("New user?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),),
                            Text("  Register",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.lightBlue,
                                  fontSize: 18
                              ),),
                          ],
                        ),
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
