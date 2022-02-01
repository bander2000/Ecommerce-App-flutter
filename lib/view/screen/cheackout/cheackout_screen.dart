import 'package:flutter/material.dart';
import 'package:test_project/constant.dart';
import 'package:status_change/status_change.dart';
import 'package:test_project/controller/cheack_out_controller.dart';
import './add_address_widget.dart';
import './delevery_time_widget.dart';
import './summary_widget.dart';
import 'package:get/get.dart';

class CheackoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheackOutController>(
        init: CheackOutController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0.0,
                title: Text(
                  "Order Status",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              body:  Column(
                    children: [
                   Container(
                            height: 100,
                            child: StatusChange.tileBuilder(
                  theme: StatusChangeThemeData(
                    direction: Axis.horizontal,
                    connectorTheme: ConnectorThemeData(space: 1.0, thickness: 1.0),
                  ),
                  builder: StatusChangeTileBuilder.connected(
                    itemWidth: (_) =>
                        MediaQuery.of(context).size.width / 3,
                    nameWidgetBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          _processes[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: controller.getColor(index),
                          ),
                        ),
                      );
                    },
                    indicatorWidgetBuilder: (_, index) {
                      if (index <= controller.index) {
                        return DotIndicator(
                          size: 35.0,
                          border: Border.all(color: Colors.green, width: 1),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              )
                                 )));
                         } 
                         else {
                        return OutlinedDotIndicator(
                          size: 30,
                          borderWidth: 1.0,
                          color: todoColor,
                
                           );
                      }
                    },
                    lineWidgetBuilder: (index) {
                      if (index > 0) {
                        if (index == controller.index) {
                          final prevColor = controller.getColor(index - 1);
                          final color = controller.getColor(index);
                          var gradientColors;
                          gradientColors = [
                            prevColor,
                            Color.lerp(prevColor, color, 0.5)
                          ];
                          return DecoratedLineConnector(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: gradientColors,
                
                                 ),
                            ),
                          );
                        } else {
                          return SolidLineConnector(
                            color: controller.getColor(index),
                
                             );
                        }
                      } else {
                        return null;
                      }
                    },
                    itemCount: 3,
                      ),
                            ),
                          ),
                         controller. pages == Pages.DeliveryTime
                  ? DeliveryTime()
                  : controller.pages == Pages.AddAddress
                      ? AddAddress()
                      : Summary()
                       , SizedBox(height: 20)
                      , Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:[
                          controller.index == 0 
                           ? Container()
                           : Container(
                        padding: EdgeInsets.only(bottom: 15),
                        alignment:Alignment.topRight,
                        child: FlatButton(
                            onPressed: () {
                  controller.changeIndex(controller.index - 1);
                            }
                            , child: const Text('Back') ,
                  color: primaryColor,
                            )
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 15),
                        alignment:Alignment.topRight,
                        child: FlatButton(
                            onPressed: () {
                  controller.changeIndex(controller.index + 1);
                            }
                            , child: const Text('Next') ,
                  color: primaryColor,
                            )
                      )
                        ]
                      )
                
                    ],
                  ),
              ),
              // floatingActionButton: FloatingActionButton(
              //   child: Icon(Icons.skip_next),
              //   onPressed: () {
              //     controller.changeIndex(controller.index + 1);
              //   },
              //   backgroundColor: inProgressColor,
              // ),
              
            );
  }
}

final _processes = [
  'Delivery',
  'Address',
  'Summer'
];

final _content = [
  '20/18',
  '20/18',
  '20/18'
];

