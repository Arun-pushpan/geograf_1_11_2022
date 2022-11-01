import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:geograf/theme/model_theme.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../theme/model_theme.dart';
class ThemePage extends StatefulWidget {
  const ThemePage({Key? key,required  String this.title}) : super(key: key);
  final String title;
  @override
  ThemePageState createState() {
    return ThemePageState();
  }
}
class ThemePageState extends State<ThemePage> {
  void showToast(){
    Fluttertoast.showToast(msg: '  Your theme is changed ',
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body:
            Center(
              child: SizedBox(
                width: 180.0,
                height: 50,
                child: ToggleSwitch(
                  minWidth: 80.0,
                  cornerRadius: 20.0,
                  activeBgColors: [[Colors.green[800]!], [Colors.red[800]!]],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  initialLabelIndex: 0,
                  totalSwitches: 2,
                  labels: ['Light', 'Dark',],
                  radiusStyle: false,
                  onToggle: (index) {
                     showToast();

                    themeNotifier.isDark
                           ? themeNotifier.isDark = false
                          : themeNotifier.isDark = true;
                    print('switched to: $index');
                  },
                ),
                   // child: const Text("Change Theme"),
                    // onPressed: () {
                    //
                    //   themeNotifier.isDark
                    //       ? themeNotifier.isDark = false
                    //       : themeNotifier.isDark = true;
                    // }
                ),
              ),

          );
        });
  }
}