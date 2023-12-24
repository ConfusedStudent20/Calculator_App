import 'package:calculator_appp/models/button_list.dart';
import 'package:calculator_appp/providers/provider.dart';
import 'package:calculator_appp/utils/operations_function.dart';
import 'package:calculator_appp/utils/textField_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorInput extends StatefulWidget {
  const CalculatorInput({Key? key}) : super(key: key);

  @override
  State<CalculatorInput> createState() => _CalculatorInputState();
}

class _CalculatorInputState extends State<CalculatorInput> {
  final cardColor = const Color.fromARGB(255, 2, 2, 2);

  @override
  void dispose() {
    super.dispose();
    userController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Card(
                color: const Color.fromARGB(255, 109, 108, 108),
                elevation: 4.0,
                shadowColor: const Color.fromARGB(255, 244, 243, 243),
                child: TextFieldInput(
                  controller: userController,
                  textInputType: TextInputType.number,
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0,
                mainAxisExtent: 80.0,
                childAspectRatio: 1 / 1,
              ),
              itemCount: calculatorNumberButtons.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, index) {
                String buttonText = calculatorNumberButtons[index];
                return Consumer<ButtonProvider>(
                    builder: (BuildContext context, value, child) {
                  return GestureDetector(
                    onTap: () {
                      value.changeButtonColor(index);

                      handleButtonTap(buttonText);
                      //change card Color
                      value.resetButtonColor();
                    },
                    child: Card(
                      color: value.currentIndex == index
                          ? const Color.fromARGB(170, 165, 164, 164)
                          : cardColor,
                      elevation: 6.0,
                      shadowColor: const Color.fromARGB(255, 175, 173, 173),
                      child: Center(
                        child: buttonText == 'x'
                            ? const Icon(Icons.backspace_sharp,
                                color: Colors.red)
                            : Text(
                                buttonText,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                      ),
                    ),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
