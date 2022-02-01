import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/controller/bottom_tab_controller.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<BottomTabController>(

                  init: BottomTabController(),
                  builder: (controller) => Scaffold(
                  body: controller.currentScreen,
                bottomNavigationBar: BottomNavigationBar(
                  elevation: 0,

      items: [
        BottomNavigationBarItem(
            label: '',
            activeIcon: 
            const Padding(padding: EdgeInsets.only(top: 20),
              child: Text('Explore'),
            ),
            icon: Image.asset(
              'assets/images/Icon_Explore.png',
              fit: BoxFit.contain,
              width: 20,
            )),
        BottomNavigationBarItem(
           label: '',
           activeIcon: 
            const Padding(padding: EdgeInsets.only(top: 20),
              child: Text('Cart'),
            ),
            icon: Image.asset('assets/images/Icon_Cart.png',
                fit: BoxFit.contain, width: 20)),
        BottomNavigationBarItem(
           label: '',
           activeIcon: 
            const Padding(padding: EdgeInsets.only(top: 20),
              child: Text('User'),
            ),
            icon: Image.asset('assets/images/Icon_User.png',
                fit: BoxFit.contain, width: 20)),
         
         if(controller.isAdmin)
       
           BottomNavigationBarItem(
           label: '',
           activeIcon: 
            const Padding(padding: EdgeInsets.only(top: 20),
              child: Text('Dashboard'),
            ),
            icon: Image.asset('assets/images/Icon_Cart.png',
            fit: BoxFit.contain, width: 20))
         

         
      ],
      currentIndex: controller.navigatorValue,
      onTap: (value)=>controller.changeSelectedValue(value),
      selectedItemColor: Colors.black,
    ),
              ),
    );
  }
}