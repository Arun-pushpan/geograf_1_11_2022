import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:profile/profile.dart';
class Userprofile extends StatefulWidget {
  const Userprofile({Key? key,required String this.title}) : super(key: key);
  final String title;

  @override
  State<Userprofile> createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {
  String? names,emails;
  @override
  void initState(){
    super.initState();
    readData();

  }
  bool isLoading=true;
  List<String> name = [];
  List<String> email = [];
   Future<void>readData()async{

    var url="https://geograf-55852-default-rtdb.firebaseio.com/"+"register.json";

    try{
      final response =await http.get(Uri.parse(url));
      final extractedData= json.decode(response.body) as Map< String ,dynamic>;
      if(extractedData==null){
        return ;
      }extractedData.forEach((id,blogData){
        name.add(blogData["Name"]);
        email.add(blogData["Email"]);
        names=name.last;
        emails=email.last;
           });
 setState(() {
   isLoading=false;
 });

    }catch(error){
      throw error;
    }

  }


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
        title: Text(
          widget.title ,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),
     body: Container(

        padding: EdgeInsets.only(left: 30,right: 30,bottom: 50,top: 40),
        child: ListView(
            children: [

        Column(
        children: [
          SizedBox.fromSize(
            size: Size(70, 70),
            child: ClipOval(
              child: Material(
                color: Colors.greenAccent,
                child: InkWell(
                  splashColor: Colors.black,
                  onTap: () {
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.account_circle),
// text
                    ],
                  ),
                ),
              ),
            ),
          ),SizedBox(height: 30),


           Text('$names',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),),
          Text('$emails',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900)),
                  SizedBox(height: 40,),
          Divider(height: 20,color: Colors.black,),
          Text("Posts 0            Rating *",
            style: TextStyle(fontSize:25,
          fontWeight: FontWeight.w900),),
       //  GridView(
       //    shrinkWrap: true,
       //
       //    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
       //                  crossAxisCount: 3,
       //                  mainAxisSpacing: 2,
       //                  crossAxisSpacing: 2,
       //                ),
       //
       // )

      ]

        )
    ]
    ),
    )



    );
  }
}
