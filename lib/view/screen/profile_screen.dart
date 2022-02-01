import 'package:flutter/material.dart';
import 'package:test_project/controller/profile_controller.dart';
import 'package:get/get.dart';
import 'package:test_project/view/screen/login_screen.dart';
import 'package:test_project/view/widget/custome_text.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) => 
      controller.isLoading.value
      ? CircularProgressIndicator()
      :  Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 40,left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100)
                        ) ,
                        image: DecorationImage(
                          image: controller.user == null 
                           ? AssetImage('assets/images/avatar.jpg')
                           : controller.user.pic == 'defualt' 
                           ? AssetImage('assets/images/avatar.jpg')
                           : Image.network(controller.user.pic ,
                           fit: BoxFit.fill,
                           )
                        )
                      ),
                  ),
                  Column(
                    children: [
                      CustomeText(
                       text: controller.user.email,
                       fontSize:20
                      ),
                      SizedBox(height: 10),
                      CustomeText(
                       text: controller.user.name,
                       fontSize:18
                      )
                    ],
                  )
                ],
              ) 
            ),
           const SizedBox(
                  height: 50,
                ),
            Container(
              child: FlatButton(
                onPressed: () {

                }
              , child: ListTile(
                    title: const CustomeText(
                      text: 'Edit profile',
                    ),
                    leading: Image.asset('assets/images/Icon_User.png'),
                    trailing: const Icon(
                      Icons.arrow_right_alt,
                      color: Colors.black,
                    ),

               )
               ),
            )
            ,
              Container(
              child: FlatButton(
                onPressed: () {

                }
              , child: ListTile(
                    title: const CustomeText(
                      text: 'Edit profile',
                    ),
                    leading: Image.asset('assets/images/Icon_User.png'),
                    trailing: const Icon(
                      Icons.arrow_right_alt,
                      color: Colors.black,
                    ),

               )
               ),
            )
            ,
              Container(
              child: FlatButton(
                onPressed: () {

                }
              , child: ListTile(
                    title: const CustomeText(
                      text: 'Edit profile',
                    ),
                    leading: Image.asset('assets/images/Icon_User.png'),
                    trailing: const Icon(
                      Icons.arrow_right_alt,
                      color: Colors.black,
                    ),

               )
               ),
            )
            ,
              Container(
              child: FlatButton(
                onPressed: () {

                }
              , child: ListTile(
                    title: const CustomeText(
                      text: 'Edit profile',
                    ),
                    leading: Image.asset('assets/images/Icon_User.png'),
                    trailing: const Icon(
                      Icons.arrow_right_alt,
                      color: Colors.black,
                    ),

               )
               ),
            )
            ,
              Container(
              child: FlatButton(
                onPressed: () {

                }
              , child: ListTile(
                    title: const CustomeText(
                      text: 'Edit profile',
                    ),
                    leading: Image.asset('assets/images/Icon_User.png'),
                    trailing: const Icon(
                      Icons.arrow_right_alt,
                      color: Colors.black,
                    ),

               )
               ),
            )
          ],
        )
      )
      );
  }
}
