import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
class Notifications extends StatefulWidget {
  const Notifications({Key? key,required String this.title}) : super(key: key);
  final String title;
  @override
  State<Notifications> createState() => _NotificationState();
}

class _NotificationState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    bool forAndroid=false;
    return Scaffold(
        appBar: AppBar(
        flexibleSpace: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: <Color>[Colors.teal.shade900, Colors.black])),
    ),
    title: Text(
      widget.title ,
    style: const TextStyle(
    fontSize: 30, fontWeight: FontWeight.w900, color: Colors.white),
    ),
    ),
    body: Center(
      child: Container(
        width: 400,
        height: 500,
        color: Colors.black12,
        child: Column(
          children: [
             Padding(padding: EdgeInsets.only(left: 30,right: 10,bottom: 10,top: 90),
                 child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('Notifications',textStyle:  TextStyle(fontSize:35,
                        fontWeight: FontWeight.w900),),

                  ],
                )

              // child: Text("Notifications",
              //   style: TextStyle(fontSize:35,fontWeight:FontWeight.w900,
              //     color:Colors.black,),),
            ), SizedBox(height: 70,),

            Center(

             child:ToggleSwitch(
                  minWidth: 90.0,
                  cornerRadius: 20.0,
                  activeBgColors: [[Colors.green[800]!], [Colors.red[800]!]],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  initialLabelIndex: 1,
                  totalSwitches: 2,
                  labels: ['On', 'Off',],
                  radiusStyle: true,
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
            ),
            const Padding(padding: EdgeInsets.only(left: 20,right: 10,bottom: 10,top: 50),
              child: Text("Turn Off Your Notifications",
                style: TextStyle(fontSize:25,fontWeight:FontWeight.w900),),
            ), SizedBox(height: 30,)

          ],
        ),
      ),
    )
    );
  }
}
