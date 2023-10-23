import 'package:flutter/material.dart';

/// ToggleButton Test Demo
///
/// Prefer to use OverlayEntry to handle this situation
class ToggleButtonWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ToggleButtonWidgetState();
}

class ToggleButtonWidgetState extends State<ToggleButtonWidget> {
  List<bool> isSelected = [false, true, false];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
        offset: const Offset(0, 60),
        itemBuilder: (context) {
          return [
            PopupMenuItem<int>(
                value: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: ToggleButtons(
                    isSelected: isSelected,
                    onPressed: (index) {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < isSelected.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            isSelected[buttonIndex] = true;
                          } else {
                            isSelected[buttonIndex] = false;
                          }
                        }
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'First Toggle',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Second Toggle',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Third Button',
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ))
          ];
        });
  }
}
