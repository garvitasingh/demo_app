import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../controller/auth_controller.dart';
import '../utils/colors.dart';
import 'widgets/custom_button_widget.dart';
import 'widgets/gradient_circle_widget.dart';

class OtpView extends StatefulWidget {
  final String email;
  const OtpView({super.key, required this.email});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final AuthController _controller = Get.put(AuthController());

  late Timer _timer;
  late int _secondsRemaining;

  @override
  void initState() {
    super.initState();
    _secondsRemaining = 60;
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  String formatSeconds(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String minutesStr = minutes < 10 ? '0$minutes' : '$minutes';
    String secondsStr =
    remainingSeconds < 10 ? '0$remainingSeconds' : '$remainingSeconds';
    return '$minutesStr:$secondsStr';
  }

  void resendOTP() {
    setState(() {
      _secondsRemaining = 60;
      startTimer();
    });
  }

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
                "Verify Otp",
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
                      SizedBox(height: h*0.1,),
                      Text(
                        formatSeconds(_secondsRemaining),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.lightBlue,
                        ),
                      ),
                      SizedBox(height:  h*0.05,),
                      Container(
                        height: 55,
                        child: OTPTextField(
                          length: 4,
                          width:w*0.6,
                          fieldWidth: 42,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                          outlineBorderRadius: 10,
                          textFieldAlignment: MainAxisAlignment.spaceBetween,
                          fieldStyle: FieldStyle.box,
                          otpFieldStyle: OtpFieldStyle(
                            focusBorderColor: AppColors.lightBlue,
                            borderColor: AppColors.textShadow,
                            backgroundColor: Colors.white,
                            disabledBorderColor: AppColors.textShadow,
                            enabledBorderColor: AppColors.textShadow,
                          ),
                          onCompleted: (String? pin) {
                            print("Completed: " + pin!);
                            _controller.otpController.text = pin;
                          },
                          onChanged: (String? pin) {
                            if (pin?.length == 4) {
                              _controller.otpController.text = pin!;
                            }
                          },
                        ),
                      ),
                      SizedBox(height:  50,),
                      _controller.loading.isTrue
                      ?CircularProgressIndicator()
                      :                      CustomButtonWidget(text: "Verify Otp",
                      onPress: (){
                        _controller.verifyOtp(context, widget.email);
                      },),
                      SizedBox(height:  50,),
                      InkWell(
                        onTap: _secondsRemaining > 0 ? null : resendOTP,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Didn't get otp ?   ",
                                style: TextStyle(color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: 'Resend',
                                style: TextStyle(color:  _secondsRemaining > 0 ? Colors.grey : Colors.blue,
                                    fontWeight: FontWeight.w500,
                                fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
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
