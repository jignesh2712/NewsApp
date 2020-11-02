
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news/Categories.dart';
import 'package:news/Databaseservice.dart';
import 'package:news/auth.dart';
import 'package:news/loading.dart';
import 'package:news/news.dart';
import 'package:news/settings.dart';
import 'package:news/user.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget
{
 @override
 HomeScreenState createState()=>HomeScreenState();
  
}
class HomeScreenState extends State<HomeScreen>{
  final AuthService _auth=AuthService();
 
 List data;
   String url = 'http://newsapi.org/v2/top-headlines?country=in&apiKey=50b2fb7d205f4f62aab51d7d7490ca55';
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
  @override
   void initState() {  
    this.makeRequest();
    super.initState(); 
  }
 
   
  @override
  Widget build(BuildContext context) {
  //final userdata=Provider.of<UserData>(context);
    final user=Provider.of<User>(context);
    
   
   return StreamProvider<List<News>>.value(
     value:DatabaseService().news,
     child: Scaffold(
     appBar: new AppBar(
       title: Text("News"),
       actions: <Widget>[
        FlatButton.icon(
                       onPressed: (){Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => HomeScreen()),
  );},
           icon:Icon( Icons.refresh), label:Text("Resfresh") )
        
       ],
     ),
      drawer: new Drawer(
        
        child: new ListView(
           
            
          children: <Widget>[
          
           StreamBuilder<UserData>(
      stream:DatabaseService(uid:user.uid).userData,
            
           builder: (context, snapshot){
        if(snapshot.hasData)
        {
          UserData userData=snapshot.data;
   
    return Card(
             child:Container(
               color: Colors.blue,
              
              child : UserAccountsDrawerHeader(
                accountName: new Text(userData.name),
                accountEmail: new Text(userData.mail),
                currentAccountPicture: CircleAvatar(
                    child:Icon(Icons.person)),
              ),
               ),
               
              );}
    else{
     return Loading();
    }}
           ),     
            new Column(
                children: <Widget>[
                  new ListTile(
                     leading:   FlatButton.icon(
                       onPressed: (){},
           icon:Icon( Icons.home), label:Text("Home") ),),
                      new Divider(),
                 new ListTile(
                     leading:   FlatButton.icon(
            onPressed: (){Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SettingForm()),
  );},
           icon:Icon( Icons.settings), label:Text("settings") ),),
          Divider(),
            new ListTile(
                     leading:   FlatButton.icon(
            onPressed: (){Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Categories()),
  );},
           icon:Icon( Icons.settings), label:Text("Categories") ),),
                      new Divider(),

                      new ListTile(
                   leading: FlatButton.icon(onPressed: ()async {
                    await _auth.signOut();

                  }, icon:Icon( Icons.person), label:Text("Logout") ),    
                         )   ],
              ),
            
           
          ],
        ),
      ),
   body:   new ListView.builder( 
            itemCount: data == null ? 0 : data.length,  
            padding: EdgeInsets.all(1.0),
             itemBuilder: (BuildContext context, i) {
               if (data[i]['title']!=null && data[i]['urlToImage']!=null && data[i]['description']!=null ){
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

              } }), 
    
    ), ); }
   
    

}