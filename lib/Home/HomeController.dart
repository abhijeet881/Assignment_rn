import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../Model/ModelGrid.dart';

class HomeController extends GetxController {
  List<ModelGrid> _grids = [];
  double _sqrtNumber = 2;

  double get sqrtNumber => _sqrtNumber;

  set sqrtNumber(double value) {
    _sqrtNumber = value;
    update();
  }

  List<ModelGrid> get grids => _grids;

  set grids(List<ModelGrid> value) {
    _grids = value;
    update();
  }

  TextEditingController editTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void gridLogic() {
    if (editTextController.text.toString().isNotEmpty) {
      sqrtNumber = sqrt(int.parse(editTextController.text.toString()));
      int a = sqrtNumber.toInt();
      if (sqrtNumber == a) {
        grids.clear();
        for (int i = 0;
            i < int.parse(editTextController.text.toString());
            i++) {
          var model = ModelGrid();
          model.value = 0;
          grids.add(model);
        }
        Future.delayed(const Duration(seconds: 3), () {
          List<ModelGrid> temp = grids;
          var rng = Random();
          temp[rng.nextInt(temp.length)].value = 1;
          grids = temp;
        });
        FocusManager.instance.primaryFocus?.unfocus();
      } else {
        editTextController.text = "";
        FocusManager.instance.primaryFocus?.unfocus();
        sqrtNumber = 0.0;
      }
    }
  }

  void onTapLogic(int index) {
    if (grids[index].value == 1) {
      List<ModelGrid> temp = grids;
      temp[index].value = 2;
      var ranIndex = -1;
      var exist = 0;
      for (int i = 0; i < grids.length; i++) {
        var rng = Random();
        ranIndex = rng.nextInt(temp.length);
        if (temp[ranIndex].value == 0) {
          exist = 1;
          break;
        }
      }

      if (temp[ranIndex].value != 2) {
        temp[ranIndex].value = 1;
      }
      grids = temp;
      if (exist == 0) {
        Get.defaultDialog(
          title: "",
            middleText: "Wow!, You did it!",
            backgroundColor: Colors.white,
            middleTextStyle: TextStyle(color: Colors.black),
            radius: 8
        );
      }
    }
  }
}
