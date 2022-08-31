import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Model/ModelGrid.dart';

class HomeController extends GetxController {
  List<ModelGrid> _grids = [];

  double _sqrtNumber = 0;
  TextEditingController editTextController = TextEditingController();

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
          model.id = i;
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
    List<int> tempG = [];
    if (grids[index].value == 1) {
      List<ModelGrid> temp = grids;
      temp[index].value = 2;
      for (int j = 0; j < temp.length; j++) {
        if (temp[j].value == 0) {
          tempG.add(temp[j].id);
        }
      }
      if (tempG.isNotEmpty) {
        var ranId = tempG[Random().nextInt(tempG.length)];
        temp[ranId].value = 1;
      }else {
        Get.defaultDialog(
            title: "",
            middleText: "Wow!, You did it!",
            backgroundColor: Colors.white,
            middleTextStyle: const TextStyle(color: Colors.black),
            radius: 8);
      }
      grids = temp;
    }
  }
}
