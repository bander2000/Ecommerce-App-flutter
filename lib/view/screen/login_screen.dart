import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test_project/controller/auth_controller.dart';
import 'package:test_project/view/screen/register_screen.dart';
import 'package:test_project/view/widget/custome_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 50, right: 25, left: 25, bottom: 25),
        child: GetBuilder<AuthController>(
          init: AuthController(),
          builder: (controller) => SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomeText(text: 'Welcome', fontSize: 30),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const RegisterScreen());
                      },
                      child: const CustomeText(
                        text: 'Sign up',
                        fontSize: 20,
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            CustomeText(
                              text: 'Email',
                              fontSize: 14,
                              color: Colors.grey.shade900,
                            ),
                            TextFormField(
                              onSaved: (value) {
                                controller.email = value;
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Email Not valid';
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: 'iamdavid@gmail.com',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                fillColor: Colors.white,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          children: [
                            CustomeText(
                              text: 'Password',
                              fontSize: 14,
                              color: Colors.grey.shade900,
                            ),
                            TextFormField(
                              onSaved: (value) {
                                controller.password = value;
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'password Not valid';
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: '...........',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                fillColor: Colors.white,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        const CustomeText(
                          text: 'Forgot Password?',
                          fontSize: 14,
                          alignment: Alignment.topRight,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 30,
                ),
                if (controller.isLoading.value)
                  const CircularProgressIndicator()
                else
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minWidth: double.infinity,
                    onPressed: () {
                    
                      _formKey.currentState.save();
                      if (_formKey.currentState.validate()) {
                        controller.signInWihtEmailAndPaaword();
                      }
                     
                    },
                    color: const Color.fromRGBO(0, 197, 105, 1),
                    child: const Text('sign in'),
                    textColor: Colors.white,
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
