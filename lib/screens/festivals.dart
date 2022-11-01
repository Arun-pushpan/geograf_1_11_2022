import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/position/gf_position.dart';
import 'rout_page.dart'as r;
class Festival extends StatefulWidget {
  const Festival({Key? key,required String this.title}) : super(key: key);
  final String title;
  @override
  State<Festival> createState() => _FestivalState();
}

class _FestivalState extends State<Festival> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: <Color>[Colors.teal.shade900, Colors.black])),
          ),
          title:  Text(
            widget.title,
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.w900, color: Colors.white),
          ),
        ),
        body: Container(

            padding: const EdgeInsets.only(left: 0,right: 0,bottom: 50,top: 30),
            child: ListView.builder(
                itemCount: 40,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 800,
                    child: GFCard(
                      elevation: 20,
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          colors: [Colors.white12, Colors.black]
                      ),
                      boxFit: BoxFit.cover,
                      titlePosition: GFPosition.start,
                      image: Image.asset(
                        'assets/img1.jpg',
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.3,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 2.3,
                        fit: BoxFit.cover,
                      ),
                      showImage: true,
                      title: const GFListTile(
                        avatar: GFAvatar(
                          backgroundImage: AssetImage('assets/img1.jpg'),
                        ),
                        titleText: 'Amal',
                        subTitleText: 'Delhi',
                      ),
                      content: const Text(
                          "Nature is not a place to visit, it is home."),
                      buttonBar: const GFButtonBar(
                        children: <Widget>[
                          GFAvatar(
                            backgroundColor: GFColors.DARK,
                            child: Icon(
                              Icons.location_on,
                              color: Colors.white,

                            ),
                          ),
                          GFAvatar(
                            backgroundColor: GFColors.SECONDARY,
                            child: Icon(
                              Icons.star_rate,
                              color: Colors.white,
                            ),
                          ),
                          GFAvatar(
                            backgroundColor: GFColors.SUCCESS,
                            child: Icon(
                              Icons.favorite,
                              color: Colors.black,
                            ),
                          ),
                          GFAvatar(
                            backgroundColor: GFColors.PRIMARY,
                            child: Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                }
            )
        ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.sort), onPressed: () {

            }),
            Spacer(),
            IconButton(icon: Icon(Icons.place), onPressed: () {}),

          ],
        ),
      ),
      floatingActionButton: SpeedDial( //Speed dial menu
       // marginBottom: 10, //margin bottom
        icon: Icons.menu, //icon on Floating action button
        activeIcon: Icons.close, //icon when menu is expanded on button
        backgroundColor: Colors.deepOrangeAccent, //background color of button
        foregroundColor: Colors.white, //font color, icon color in button
        activeBackgroundColor: Colors.deepPurpleAccent, //background color when menu is expanded
        activeForegroundColor: Colors.white,
       // buttonSize: 20, //button size
        visible: true,
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        onOpen: () => print('OPENING DIAL'), // action when menu opens
        onClose: () => print('DIAL CLOSED'), //action when menu closes

        elevation: 8.0, //shadow elevation of button
        shape: CircleBorder(), //shape of button

        children: [
          SpeedDialChild( //speed dial child
            child: Icon(Icons.camera_alt_outlined),

            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            label: 'Camera',
            labelStyle: TextStyle(fontSize: 18.0),
            //onTap: () => Img(),
            //onLongPress: () => Img(),
          ),
          SpeedDialChild(
            child: Icon(Icons.keyboard_voice_sharp),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.black,
            label: 'Voice',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => print(' Open Gallery'),
            onLongPress: () => print('Long Press'),
          ),
          SpeedDialChild(
            child: Icon(Icons.chat),
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
            label: 'Chat',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => {
              Navigator.pushNamed(context, r.chatPage)
            },
          ),

        ],
      ),floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}