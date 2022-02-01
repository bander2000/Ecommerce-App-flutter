import 'package:flutter/material.dart';
import 'package:test_project/constant.dart';
import 'package:test_project/view/widget/custome_text.dart';

class DeliveryTime extends StatefulWidget {
  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  @override
  Widget build(BuildContext context) {

    Delviery delviery = Delviery.StandardDelivery;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          RadioListTile<Delviery>(
            value: Delviery.StandardDelivery,
            groupValue: delviery,
            onChanged: (Delviery value) {
              setState(() {
                delviery = value;
              });
            },
            title: const CustomeText(
              text: 'Standrad Dilvery',
              fontSize: 24,
            ),
            subtitle: const CustomeText(
                text: '\n Oreder will be delivered between 5 and 11 days',
                fontSize: 18),
            activeColor: primaryColor,
          ),
    
          const SizedBox(height: 25),
    
          RadioListTile<Delviery>(
            value: Delviery.NextDayDelivery,
            groupValue: delviery,
            onChanged: (Delviery value) {
              setState(() {
                delviery = value;
              });
            },
            title: const CustomeText(
              text: 'Next Day Delivery',
              fontSize: 24,
            ),
            subtitle: const CustomeText(
                text: '\n Oreder will be delivered Next Day',
                fontSize: 18),
            activeColor: primaryColor,
          )
    
          , 
          const SizedBox(height: 25)
    
          , RadioListTile<Delviery>(
            value: Delviery.DemoniteDelivery,
            groupValue: delviery,
            onChanged: (Delviery value) {
              setState(() {
                delviery = value;
              });
            },
            title: const CustomeText(
              text: 'Demonite Dilvery',
              fontSize: 24,
            ),
            subtitle: const CustomeText(
                text: '\n picked date from cleander',
                fontSize: 18),
            activeColor: primaryColor,
          ),
         
        ],
      ),
    );
  }
}
