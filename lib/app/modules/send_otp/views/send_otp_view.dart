import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../components/custom_button.dart';
import '../../../constants/spaces.dart';
import '../controllers/send_otp_controller.dart';

class SendOtpView extends GetView<SendOtpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: EdgeInsets.all(5.w),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Verification Mail ✉️",
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    Spaces.y2,
                    const Text(
                      'We have sent a verification code to your email address. Please check your email and enter the code below.',
                    ),
                    Spaces.y2,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        buildSizedBox(context ,controller.firstController),
                        buildSizedBox(context ,controller.secondController),
                        buildSizedBox(context ,controller.thirdController),
                        buildSizedBox(context ,controller.fourthController),

                      ],
                    ),
                    Spaces.y2,
                    Align(alignment: Alignment.center, child: const Text("Didn't receive otp")),
                    Align(alignment: Alignment.center, child: Obx(() =>   Text(" can resend it in ${controller.countdownTime} sec"))),

                    Obx(() {
                      if (controller.isTimerEnded()) {
                        return CustomButton(
                          text: 'Resend OTP',
                          onPressed: () {
                            // Logic to resend OTP
                            print("call the method here");
                          },
                        );
                      }
                      return Container(); // Return an empty container when the timer is not ended
                    }),
                    Spaces.y2,
                    CustomButton(
                      text: 'Confirm',
                      onPressed: () {
                        controller.verifyOTP(context);
                      },
                    ),
                    Spaces.y2,

                  ]),
            ),
          )),
    );
  }

  SizedBox buildSizedBox(BuildContext context,TextEditingController textEditingController) {
    return SizedBox(
                        height: 68,
                        width: 64,
                        child: TextField(
                          controller: textEditingController,
                          onChanged: (value){
                            if(value.length==1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: Theme.of(context).textTheme.headlineMedium,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                              fillColor: Colors.black12,

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),

                              )
                          ),
                        ),
                      );
  }
}