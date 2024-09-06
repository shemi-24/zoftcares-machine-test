import 'package:flutter/material.dart';
import 'package:get/get.dart';

showMessage(String message) {
  ScaffoldMessenger.of(Get.context!)
      .showSnackBar(SnackBar(content: Text(message)));
}
