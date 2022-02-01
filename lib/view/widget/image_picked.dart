import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/controller/image_picker_controller.dart';

class ImagePicked extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImagePickerController>(
      init: ImagePickerController(),
      builder: (controller) => Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                backgroundImage: controller.pickedImageFile != null
                    ? FileImage(controller.pickedImageFile)
                    : null
                //  backgroundImage:
                ),
            FlatButton.icon(
                onPressed: controller.pickImage,
                icon: Icon(Icons.image),
                label: Text('Add Image'))
          ],
        ),
      )
    );
  }
}
