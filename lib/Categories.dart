 import 'package:flutter/material.dart';
import 'package:news/Categories/Science.dart';
import 'package:news/Categories/business.dart';
import 'package:news/Categories/entertainment.dart';
import 'package:news/Categories/health.dart';
import 'package:news/Categories/sports.dart';
import 'package:news/Categories/technology.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
   appBar: AppBar(
     title:Text("Categories")
   ),
   body:GridView(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,childAspectRatio:5/2),
               children: <Widget>[ ActionChip(
                 label:Text("business"),
                 onPressed: (){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Business()),
  );
                 },
                 ),
                 ActionChip(
                 label:Text("entertainment"),
                 onPressed: (){
 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Entertainment()),
  );
                 },
                 ),
                 ActionChip(
                 label:Text("health"),
                 onPressed: (){
 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Health()),
  );
                 },
                 ),
                 ActionChip(
                 label:Text("science"),
                 onPressed: (){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Science()),
  );
                 },
                 ),
                 ActionChip(
                 label:Text("sports"),
                 onPressed: (){
 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Sports()),
  );
                 },
                 ),
                 ActionChip(
                 label:Text("technology"),
                 onPressed: (){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Technology()),
  );
                 },
                 ),
                ] )
         
   );
  }
}