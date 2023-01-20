import 'package:cam_eyes/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/logging_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    final ImagePicker picker = ImagePicker();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          elevation: 0,
          centerTitle: true,
          title: const Text("CAMEYES"),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            // Pick an image

            homeController.sendRequest();
          },
          elevation: 3,
          backgroundColor: Colors.blueGrey,
          icon: const Icon(Icons.camera_alt_outlined),
          label: const Text("Pick Image"),
        ),
      ),
    );
  }
}
