import 'package:assignment_nayab/constant_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'HomeController.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (HomeController controllerHome) {
      return Scaffold(
          appBar: AppBar(
            title:  Text(Constants.title),
          ),
          body: Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          controller: controllerHome.editTextController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration:  InputDecoration(
                            hintStyle: const TextStyle(fontSize: 17),
                            hintText: Constants.editTextHint,
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.gridLogic();
                        },
                        child:  Text(
                          Constants.submit,
                          style: const TextStyle(color: Colors.white),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                controller.sqrtNumber.round() > 0
                    ? Expanded(
                      child: GridView.count(
                        crossAxisCount: controller.sqrtNumber.round(),
                        children:
                            List.generate(controller.grids.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              controller.onTapLogic(index);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black, width: 1),
                                color: controller.grids[index].value == 0
                                    ? Colors.white
                                    : controller.grids[index].value == 1
                                        ? Colors.red
                                        : Colors.blue,
                              ),
                              child: const SizedBox(),
                            ),
                          );
                        }),
                      ),
                    )
                    : const SizedBox(),
              ],
            ),
          ));
    });
  }
}
