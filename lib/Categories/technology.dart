import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/loading.dart';
import 'package:url_launcher/url_launcher.dart';

class Technology extends StatefulWidget {
  @override
  _TechnologyState createState() => _TechnologyState();
}

class _TechnologyState extends State<Technology> {
  List data;
   String url = 'http://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=50b2fb7d205f4f62aab51d7d7490ca55';
  Future<String> makeRequest() async {

print(url);
 final response = await http.get(
     url
  );
  
  print(response.body);
    setState(() {
      final extractdata = json.decode(response.body);
      print(extractdata);
      data = extractdata["articles"];
 print(extractdata);   
    });
      return null;
  }
   void initState() {  
    this.makeRequest();
    super.initState(); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Technology"),),
      body: new ListView.builder( 
            itemCount: data == null ? 0 : data.length,  
            padding: EdgeInsets.all(1.0),
             itemBuilder: (BuildContext context, i) {
               if(data[i]['title']!=null && data[i]['urlToImage']!=null && data[i]['description']!=null){

               
              return new Card( color:Colors.white,
              child: ListTile (    
              
               title:
               Column(
                 
                 children:<Widget>[
              Text(data[i]['title'],style: TextStyle(color: Colors.black,
                                fontSize: 17.0,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
              Image.network(data[i]['urlToImage']),
                                
             Text(data[i]['description'],style: TextStyle(color: Colors.black,
                                fontSize: 15.0,),textAlign: TextAlign.left,),
              
             
                   ]  ),
            
               onTap:()async {await launch(data[i]['url']);}
               ) );              
                }
                else{
                  return Loading();
                }   }), 
      
    );
  }
}