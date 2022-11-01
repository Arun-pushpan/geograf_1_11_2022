import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/position/gf_position.dart';
class Food extends StatefulWidget {
  const Food({Key? key,required String this.title}) : super(key: key);
  final String title;

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
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
                itemBuilder: (BuildContext context, int index ) {
                  return GFCard(
                    elevation: 100,
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: [Colors.white12, Colors.black]
                    ),
                    boxFit: BoxFit.cover,
                    titlePosition: GFPosition.start,
                    image: Image.asset(
                      'assets/img7.jpg',
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
                        backgroundImage: AssetImage('assets/img7.jpg'),
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
                  ),
            ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            Spacer(),
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
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
