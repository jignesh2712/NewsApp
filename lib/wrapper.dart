import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:news/homescreen.dart';
import 'package:news/signin.dart';
import 'package:news/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget{
@override
Widget build(BuildContext context){
  final user=Provider.of<User>(context);
  print(user);
  if (user==null){
 return SignIn();
  }
  else{
    return HomeScreen();
  }
 
}

}