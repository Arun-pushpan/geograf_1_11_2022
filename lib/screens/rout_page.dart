


import 'package:geograf/screens/chat.dart';
import 'package:geograf/screens/favourite.dart';
import 'package:geograf/screens/places.dart';
import 'package:geograf/screens/themepage.dart';

import 'appsetting.dart';
import 'changepsw.dart';
import 'editprofile.dart';
import 'festivals.dart';
import 'food.dart';
import 'homepage.dart';
import 'login.dart';
import 'notification.dart';
import 'register.dart';
import 'userprofile.dart';
import 'package:flutter/material.dart';
const welcomePage='welcome';
const loginPage ="login";
const registerPage="register";
const homePage="home";
const appSettings="setting";
const editProfile="profile";
const changePassword="password";
const userProfile="user";
const places="place";
const foods="food";
const festivals="festival";
const notifications="notification";
const otpPage="otp";
const chatPage="chat";
const favourite="favourite";
const theme="theme";

void welcome(){}
void logins(){}
void register(){}
void home(){}
void setting(){}
void profile(){}
void password(){}
void user(){}
void place(){}

Route<dynamic>controller(RouteSettings settings){
  switch(settings.name){

    case loginPage:
      {
        return MaterialPageRoute(builder: (context)=>Login());
      }
    case registerPage:
      {
        return MaterialPageRoute(builder: (context)=>Register());
      }

    case homePage:
      {
        return MaterialPageRoute(builder: (context)=>const Homepage(title: "GEOGRAF"));
      }
    case appSettings:
      {
        return MaterialPageRoute(builder: (context)=>Appsetting(title: "GEOGRAF"));
      }
    case editProfile:
      {
        return MaterialPageRoute(builder: (context)=>Editprofile(title: "GEOGRAF"));
      }
    case changePassword:
      {
        return MaterialPageRoute(builder: (context)=>Changepassword(title: "GEOGRAF"));
      }
    case userProfile:
      {
        return MaterialPageRoute(builder: (context)=>Userprofile(title: "GEOGRAF"));
      }
    case places:
      {
        return MaterialPageRoute(builder: (context)=>Place(title: "GEOGRAF"));
      }
    case foods:
      {
        return MaterialPageRoute(builder: (context)=>Food(title: "GEOGRAF"));
      }
    case festivals:
      {
        return MaterialPageRoute(builder: (context)=>Festival(title: "GEOGRAF"));
      }
    case notifications:
      {
        return MaterialPageRoute(builder: (context)=>Notifications(title: "GEOGRAF"));
      }
    case chatPage:
      {
        return MaterialPageRoute(builder: (context)=>Chat());
      }
    case favourite:
      {
        return MaterialPageRoute(builder: (context)=>Favourite());
      }
    case theme:
      {
        return MaterialPageRoute(builder: (context)=>ThemePage(title: "GEOGRAF"));
      }


    default:
      throw("no pages found");
  }
}
