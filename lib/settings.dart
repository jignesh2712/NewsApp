import 'package:flutter/material.dart';
import 'package:news/Databaseservice.dart';
import 'package:news/homescreen.dart';
import 'package:news/loading.dart';
import 'package:news/user.dart';
import 'package:provider/provider.dart';
class SettingForm extends StatefulWidget{
  @override
 _SettingFormState createState()=>_SettingFormState();

  
}

class _SettingFormState extends State<SettingForm>{

  final _formkey=GlobalKey<FormState>();
  String _currentName;
  String _currentemail;

  @override
  Widget build(BuildContext context) {

    final user=Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(
        title:Text("Settings")
      ),
      body:StreamBuilder<UserData>(
      stream:DatabaseService(uid:user.uid).userData,
      builder: (context, snapshot){
        if(snapshot.hasData)
        {
          UserData userData=snapshot.data;
    return Form(
     key: _formkey,
     child: Column(
       children:<Widget>[
          TextFormField(
              decoration: const InputDecoration(
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black87,style: BorderStyle.solid),
                                          ),
                                          focusedBorder:  UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black87,style: BorderStyle.solid),
                                          ),
                                          icon: Icon(Icons.person,color: Colors.black38,),
                                          hintText: 'Your name',
                                          labelText: 'Name',
                                          labelStyle: TextStyle(color: Colors.black54)
                                      ),
            initialValue: userData.name,
            validator:(val)=>val.isEmpty ? 'Please enter name': null,
            onChanged: (val)=>setState(()=> _currentName=val),
          ),
                     SizedBox(height: 20,),
           SizedBox(height: 20,),
TextFormField(  decoration: const InputDecoration(
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black87,style: BorderStyle.solid),
                                          ),
                                          focusedBorder:  UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black87,style: BorderStyle.solid),
                                          ),
                                          icon: Icon(Icons.email,color: Colors.black38,),
                                          hintText: 'Your email address',
                                          labelText: 'E-mail',
                                          labelStyle: TextStyle(color: Colors.black54)
                                      ),
            initialValue: userData.mail,
            validator:(val)=>val.isEmpty ? 'Please enter email': null,
            onChanged: (val)=>setState(()=> _currentemail=val),
          ),
         
           SizedBox(height: 20,),
          RaisedButton(
            child: Text("Update"),
            onPressed: ()async{
              if(_formkey.currentState.validate()){
                await DatabaseService(uid:user.uid).updateUserData(
                  _currentName ?? userData.name,
                  _currentemail ?? userData.mail,
                );
                     Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => HomeScreen()),
  );
              }
            })
       ]
     )
    
    
    );}
    else{
     return Loading();
    }}
    
     ) );
    
  }
  
}