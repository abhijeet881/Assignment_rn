
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
            title: const Text("Assignment"),
          ),
          body: Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black,width: 2),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          controller: controllerHome.editTextController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(fontSize: 17),
                            hintText: 'Enter Square root number.',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16,),
                    ElevatedButton(
                        onPressed: () {
                          controller.gridLogic();
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
                const SizedBox(height: 16,),
                Expanded(
                  child: controller.sqrtNumber.round()>0?GridView.count(
                    crossAxisCount: controller.sqrtNumber.round(),
                    children: List.generate(controller.grids.length, (index) {
                      return GestureDetector(
                        onTap: (){
                          controller.onTapLogic(index);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black,width: 1),
                              color: controller.grids[index].value==0?Colors.white:controller.grids[index].value==1?Colors.red:Colors.blue,),
                          child: const SizedBox(),
                        ),
                      );
                    }),
                  ):const SizedBox(),
                ),
              ],
            ),
          ));
    });
  }
}
