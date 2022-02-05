import 'package:cryptowatch/constants.dart';
import 'package:flutter/material.dart';

class TestingScreen extends StatefulWidget {
  @override
  _TestingScreenState createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  //set the initial state of each button whether it is selected or not
  List<bool> isSelected = [true, false, false, false];
  List<String> stringList = ['1D', '1W', '1M', '1Y'];
  List<int> indexList = [0, 1, 2, 3];

  @override
  Widget build(BuildContext context) {
    //wrap the GridView wiget in an Ink wiget and set the width and height,
    //otherwise the GridView widget will fill up all the space of its parent widget
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Center(
          child: Container(
            height: 40,
            child: Row(
              children: [
                Text(
                  'Time',
                  style: TextStyle(
                    color: Black6,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Wrap(
                  spacing: 12,
                  children: indexList
                      .map(
                        (index) => GestureDetector(
                          //the default splashColor is grey
                          onTap: () {
                            
                            //set the toggle logic
                            setState(() {
                              for (int indexBtn = 0;
                                  indexBtn < isSelected.length;
                                  indexBtn++) {
                                if (indexBtn == index) {
                                  isSelected[indexBtn] = true;
                                } else {
                                  isSelected[indexBtn] = false;
                                }
                              }
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 14, vertical: 8),
                            decoration: BoxDecoration(
                              //set the background color of the button when it is selected/ not selected
                              color: isSelected[index]
                                  ? PrimaryDeepBlue
                                  : Colors.transparent,
                              // here is where we set the rounded corner
                              borderRadius: BorderRadius.circular(12),
                              //don't forget to set the border,
                              //otherwise there will be no rounded corner
                            ),
                            child: Center(
                              child: Text(
                                stringList[index],
                                style: TextStyle(
                                  color: isSelected[index]
                                      ? Colors.white
                                      : Black6,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
