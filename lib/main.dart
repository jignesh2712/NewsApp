import 'package:flutter/material.dart';
import 'package:news/auth.dart';
import 'package:news/homescreen.dart';
import 'package:news/signin.dart';
import 'package:news/user.dart';
import 'package:news/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
      
     home:Wrapper(),
      )
    );
    
  }
  
}

