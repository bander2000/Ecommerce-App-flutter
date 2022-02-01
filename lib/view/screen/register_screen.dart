import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/controller/auth_controller.dart';
import 'package:test_project/view/screen/login_screen.dart';
import 'package:test_project/view/widget/custome_text.dart';
import 'package:test_project/view/widget/image_picked.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key key }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
         leading: GestureDetector(
            onTap: () {
              Get.off(()=>const LoginScreen());
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 35, right: 25, left: 25, bottom: 15),
        child: GetBuilder<AuthController>(
          init: AuthController(),
          builder: (controller) => SingleChildScrollView(
            child: Column(
              children: [
               CustomeText(text: 'Sign up', fontSize: 30),
                const SizedBox(
                  height: 40,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImagePicked(),
                       const SizedBox(height: 20),
                           Column(
                      children: [
                        CustomeText(
                          text: 'User Name',
                          fontSize: 14,
                          color: Colors.grey.shade900,
                        ),
                        TextFormField(
                          onSaved: (value) {
                            controller.name = value;
                          },
                          validator: (value) {
                            if (value == null) {
                             return 'Email Not valid';
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'pesa',
                            hintStyle:  TextStyle(
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
                            hintStyle:  TextStyle(
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
                            hintStyle:  TextStyle(
                              color: Colors.black,
                            ),
                            fillColor: Colors.white,
                          ),
                        )
                      ],
                    ),
                      
                      ],
                    )),

                const SizedBox(
                  height: 30,
                ),

                if (_isLoading)
                  CircularProgressIndicator()

                else
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minWidth: double.infinity,
                    onPressed: () {
                      
                      setState(() {
                        _isLoading = true;
                      });

                      _formKey.currentState.save();
                      if (_formKey.currentState.validate()) {
                        controller.signUpWihtEmailAndPaaword();
                      }
                      
                      setState(() {
                        _isLoading = false;
                      });

                    },
                    color: const Color.fromRGBO(0, 197, 105, 1),
                    child: const Text('sign Up'),
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