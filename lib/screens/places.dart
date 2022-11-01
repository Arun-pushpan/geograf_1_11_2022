
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/position/gf_position.dart';
class Place extends StatefulWidget {
  const Place({Key? key,required String this.title}) : super(key: key);
  final String title;

  @override
  State<Place> createState() => _PlaceState();
}
class _PlaceState extends State<Place> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: <Color>[Colors.teal.shade500, Colors.black])),
        ),
        title: Text(
          widget.title,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),backgroundColor:Color.fromRGBO(255, 255, 255, 1),
      body: Container(
          padding: EdgeInsets.only(left: 0,right: 30,bottom: 50,top: 0),
          child: ListView.builder(
              itemCount: 40,
              itemBuilder: (BuildContext context, int index) {
                return GFCard(
                  elevation: 20,
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [Colors.white12, Colors.black]
                  ),
                  boxFit: BoxFit.cover,
                  titlePosition: GFPosition.start,
                  image: Image.asset(
                    'assets/img11.jpg',
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
                      backgroundImage: AssetImage('assets/img11.jpg'),
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
                );

              }
          )
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.sort), onPressed: () {}),
            Spacer(),
            IconButton(icon: Icon(Icons.place), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
      ),
      floatingActionButton:
      FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
