import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Editprofile extends StatefulWidget {
  const Editprofile({Key? key,required String this.title}) : super(key: key);
  final String title;
  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final _formKey=GlobalKey<FormState>();
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
    return Form(
      key: _formKey,
        child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: <Color>[Colors.teal.shade900, Colors.black])),
          ),
          title: Text(widget.title , style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w900, color: Colors.white),
          ),
        ),
    body: Container(

        padding: EdgeInsets.only(left: 30,right: 30,bottom: 50,top: 70),
        child: ListView(
            children: [

        Column(
        children: [
          Padding(padding: EdgeInsets.only(left: 10,right: 20,bottom: 10,top: 0),
              child:Text("Edit Profile",style: TextStyle(fontSize:30,fontWeight: FontWeight.w800,),)

          ),
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
          ),
        Padding(padding: EdgeInsets.only(left: 30,right: 20,bottom: 10,top: 20),
          child: TextFormField(
            style:  TextStyle(color: Colors.black,fontSize:25,fontWeight: FontWeight.w900),
            decoration: InputDecoration(
                border:OutlineInputBorder(),
                hintText: '$names',
                hintStyle:TextStyle(fontWeight:FontWeight.w700,fontSize:25),
               // label: Text("Name",style: TextStyle(fontSize:22,fontWeight: FontWeight.w900),),

            ),
              validator: (value){
                if(value!.isEmpty){
                  return 'Please enter your name';
                }
                if(!RegExp(r"^[a-zA-Z]+ [a-zA-Z]+$").hasMatch(value)){
                  return "Please enter valid name";
                }
                return null;
              }
          ),
        ),
          Padding(padding: EdgeInsets.only(left: 30,right: 20,bottom: 10,top: 20),
            child: TextFormField(
                style:  TextStyle(fontSize:20,fontWeight: FontWeight.w900),
              decoration: InputDecoration(
                border:OutlineInputBorder(),
               hintText: '$emails',
                hintStyle:TextStyle(fontWeight:FontWeight.w700,fontSize:25),
                label: Text("Email",style: TextStyle(fontSize:22,fontWeight: FontWeight.w900)),

              ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please enter your email';
                  }
                  if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$").hasMatch(value)){
                    return "Please enter valid email";
                  }
                  return null;
                }
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 30,right: 20,bottom: 10,top: 20),
            child: TextFormField(
                style:  TextStyle(fontSize:20,fontWeight: FontWeight.w900),
              decoration: InputDecoration(
                border:OutlineInputBorder(),
              //  hintText: "Phone No",
               // hintStyle:TextStyle(color: Colors.white,fontWeight:FontWeight.w700,fontSize:15),
                label: Text("Phone Number",style: TextStyle(fontSize:22,fontWeight: FontWeight.w900)),

              ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please enter your phone number';
                  }
                  if(!RegExp(r"^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$").hasMatch(value)){
                    return "Please enter valid phone number";
                  }
                  return null;
                }
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 30,right: 20,bottom: 10,top: 20),
            child: TextFormField(
                style:  TextStyle(fontSize:20,fontWeight: FontWeight.w900),
              decoration: InputDecoration(
                border:OutlineInputBorder(),
               // hintText: "Password",
              //  hintStyle:TextStyle(color: Colors.white,fontWeight:FontWeight.w700,fontSize:15),
                label: Text("Password",style: TextStyle(fontSize:22,fontWeight: FontWeight.w900)),
              ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please enter your password';
                  }
                  if(!RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$").hasMatch(value)){
                    return "Please enter valid password";
                  }
                  return null;
                }
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 20,right: 10,bottom: 10,top: 20),
              child:Container(
                width:270,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()){


                    }
                  },
                  child: const Text(
                    'Save',
                  ),
                ),


              )

          ),
        ]
    ),
    ]
    ),
    ),
    ),
      );
  }
}
