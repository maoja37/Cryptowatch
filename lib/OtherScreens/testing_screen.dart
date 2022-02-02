    import 'package:flutter/material.dart';

    class TestingScreen extends StatefulWidget {
      @override
      State<TestingScreen> createState() => _TestingScreenState();
    }

    class _TestingScreenState extends State<TestingScreen> {
      List<bool> _isSelected = [true, false, false, false];

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 100),
            child: Row(
              children: [
                Text(
                  'Time',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                ToggleButtons(
                  color: Color(0xff001666),
                  fillColor: Color(0xff001666),
                  selectedColor: Colors.white,
                  children: [
                    ToggleButton(name: '1D'),
                    ToggleButton(name: '1W'),
                    ToggleButton(name: '1M'),
                    ToggleButton(name: '1Y'),
                  ],
                  isSelected: _isSelected,
                  onPressed: (int newIndex) {
                    setState(() {
                      for (int i = 0; i < _isSelected.length; i++) {
                        if (i == newIndex) {
                          _isSelected[i] = true;
                        } else {
                          _isSelected[i] = false;
                        }
                        print(_isSelected);
                      }
                    });
                  },
                )
              ],
            ),
          ),
        );
      }
    }
       
    class ToggleButton extends StatelessWidget {
      final String name;
      const ToggleButton({Key? key, required this.name}) : super(key: key);

      @override
      Widget build(BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.1,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          padding: EdgeInsets.symmetric(vertical: 4),
          alignment: Alignment.center,
          child: Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      }
    }  
