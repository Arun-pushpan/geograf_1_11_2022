import 'package:flutter/material.dart';
class Changepassword extends StatefulWidget {
  const Changepassword({Key? key,required String this.title}) : super(key: key);
  final String title;

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  final _formkey=GlobalKey<FormState>();
  @override
  bool  _isObscure=true;
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: <Color>[Colors.teal.shade900, Colors.black])),
          ),
          title: Text(
            widget.title,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w900),
          ),
        ),
      body: Container(

        padding: EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 80),
        child: ListView(children: [
          Text('Change Password',style: TextStyle(fontSize:30,fontWeight: FontWeight.w900),),
        SizedBox(height: 50),
          Padding(padding: EdgeInsets.only(left: 10,right: 20,bottom: 10,top: 20),
            child: TextFormField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText:"Enter Current Password",
                hintStyle:TextStyle(fontSize:15,fontWeight: FontWeight.w900),
                label:Text ("Password",style: TextStyle(fontSize:22,fontWeight: FontWeight.w900),),
                icon: Icon(Icons.lock),
                suffixIcon: IconButton(

                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,

                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please enter your password';
                  }
                  if(!RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,12}$").hasMatch(value)){
                    return "Please enter valid password";
                  }
                  return null;
                }
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 10,right: 20,bottom: 10,top: 20),
            child: TextFormField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText:"Enter New Password",
                hintStyle:TextStyle(fontSize:15,fontWeight: FontWeight.w900),
                label:Text (" New Password",style: TextStyle(fontSize:22,fontWeight: FontWeight.w900),),
                icon: Icon(Icons.lock_open_sharp),
                suffixIcon: IconButton(

                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,

                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please enter your password';
                  }
                  if(!RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,12}$").hasMatch(value)){
                    return "Please enter valid password";
                  }
                  return null;
                }
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 10,right: 20,bottom: 10,top: 20),
            child: TextFormField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText:"Enter Confirm Password",
                hintStyle:TextStyle(fontSize:15,fontWeight: FontWeight.w900),
                label:Text ("Confirm Password",style: TextStyle(fontSize:22,fontWeight: FontWeight.w900),),
                icon: Icon(Icons.lock_clock_rounded,),
                suffixIcon: IconButton(

                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,

                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please enter your password';
                  }
                  if(!RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,12}$").hasMatch(value)){
                    return "Please enter valid password";
                  }
                  return null;
                }
            ),
          ),
          Container(
            width: 120,
            height: 80,
            child: Padding(padding: EdgeInsets.only(left: 60,right: 30,bottom: 10,top: 20),
                child:ElevatedButton(
                  onPressed:(){
                    if(_formkey.currentState!.validate()){

                    }
                  }, child: Text("Save",
                  style:TextStyle(fontWeight:FontWeight.w700,
                      fontSize:30),),

                )

            ),
          ),
        ],
      ),

      ),
      ),
    );
  }
}
