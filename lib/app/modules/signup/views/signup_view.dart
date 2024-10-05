import 'package:duseca_task_2/app/components/validater.dart';
import 'package:duseca_task_2/app/constants/spaces.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../components/custom_button.dart';
import '../../../components/custom_textfield.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('Sign Up'),
          centerTitle: true,
        ),
        body: Padding(
            padding: EdgeInsets.all(5.w),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Hello there 👋',
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      Spaces.y2,
                      const Text(
                        'Please enter your username/email and password to sign up.',
                      ),
                      Spaces.y2,
                      CustomTextField(
                          textEditingController:
                              controller.usernameEmailController,
                          label: 'Username/Email',
                          obscureText: false,
                          validate: (value) => validateEmail(value!)),
                      Spaces.y2,
                      Obx(
                        () => CustomTextField(
                          textEditingController: controller.passwordController,
                          label: 'password',
                          validate: (value) => validatePassword(value!),
                          sufIcon: IconButton(
                              onPressed: () => controller.toggleVisibility(),
                              icon: controller.isVisible.value
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility)),
                          obscureText: controller.isVisible.value,
                        ),
                      ),
                      Spaces.y2,
                      Obx(
                        () => CustomTextField(
                          textEditingController:
                              controller.repeatPasswordController,
                          label: 'Repeat Password',
                          obscureText: controller.isVisible.value,
                          sufIcon: IconButton(
                              onPressed: () => controller.toggleVisibility(),
                              icon: controller.isVisible.value
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility)),
                          validate: (value) => validateRepeatPassword(
                              value!, controller.passwordController.text),
                        ),
                      ),
                      Spaces.y2,
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                          ),
                          const Text('Remember me'),
                        ],
                      ),
                      Spaces.y2,
                      const Divider(),
                      Spaces.y2,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Divider(),
                          Text('or continue with'),
                          Divider(),
                        ],
                      ),
                      Spaces.y2,
                      CustomButton(
                        text: 'Signup',
                        onPressed: ()=>controller.signup(),
                      ),
                      Spaces.y2,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Google Icon Button
                          Container(
                            width: 20.w,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.w))),
                            child: IconButton(
                              icon: const FaIcon(
                                FontAwesomeIcons.google,
                                color: Color(
                                    0xFFDB4437), // Google's official color
                              ),
                              onPressed: () {
                                print("Google pressed");
                              },
                              iconSize: 7.w, // Sizer for responsive size
                            ),
                          ),
                          // Apple Icon Button
                          Container(
                            width: 20.w,
                            decoration: const BoxDecoration(
                                color: Colors.black12,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: IconButton(
                              icon: const FaIcon(
                                FontAwesomeIcons.apple,
                                color: Colors.black, // Apple's official color
                              ),
                              onPressed: () {
                                print("Apple pressed");
                              },
                              iconSize: 7.w, // Sizer for responsive size
                            ),
                          ),
                          // Facebook Icon Button
                          Container(
                            width: 20.w,
                            decoration: const BoxDecoration(
                                color: Colors.black12,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: IconButton(
                              icon: const FaIcon(
                                FontAwesomeIcons.facebook,
                                color: Color(
                                    0xFF4267B2), // Facebook's official color
                              ),
                              onPressed: () {
                                print("Facebook pressed");
                              },
                              iconSize: 7.w, // Sizer for responsive size
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account?'),
                          TextButton(
                            onPressed: () {
                              Get.toNamed('/login');
                            },
                            child: const Text('Sign In'),
                          ),
                        ],
                      ),
                    ]),
              ),
            )));
  }
}