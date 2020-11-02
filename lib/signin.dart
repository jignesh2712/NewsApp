import 'package:flutter/material.dart';
import 'package:news/auth.dart';
import 'package:news/homescreen.dart';
import 'package:news/loading.dart';
import 'package:news/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SignIn extends StatefulWidget
{
 @override
 SignInState createState()=>SignInState();
  
}
class SignInState extends State<SignIn>{
 final AuthService _auth=AuthService();
final _formkey= GlobalKey<FormState>();
  //text field state
  dynamic result='';
  String email='';
  String password='';
  String error='';
  bool loading=false;
  
  @override
  Widget build(BuildContext context) {
   return loading? Loading():Scaffold(
     appBar: new AppBar(
       title: Text("News"),
       actions: <Widget>[
         FlatButton.icon(
           icon: Icon(Icons.person),
           label: Text("Registor"),
           onPressed: (){
               Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SignUp()),
  );
           } )
       ]
     ),
    body: Container(
            padding: EdgeInsets.symmetric(vertical:20.0, horizontal: 20.0),
            child:Form(
              key: _formkey,
              child:Column(
                children: <Widget>[
                  SizedBox(
                    height:20.0
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
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
                    validator: (val)=>val.isEmpty ? 'Enter email': null,
                    onChanged:(val){
                      setState(()=>email=val );
                    }
                  ),
                  SizedBox(
                    height:20.0
                  ),
                   TextFormField(
                       decoration: const InputDecoration(
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black87,style: BorderStyle.solid),
                                          ),
                                          focusedBorder:  UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black87,style: BorderStyle.solid),
                                          ),
                                          icon: Icon(Icons.lock,color: Colors.black38,),
                                          hintText: 'Password',
                                          labelText: 'password',
                                          labelStyle: TextStyle(color: Colors.black54)
                                      ),
                     validator: (val)=>val.length <6 ? 'Enter password 6+ characters': null,
                     obscureText:true,
                    onChanged:(val){
                        setState(()=>password=val );
                    }
                    
                  ),
                    SizedBox(
                    height:20.0
                  ),
                  RaisedButton(
                    child: Text("Sign IN"),
                    onPressed: ()async{
                         if(_formkey.currentState.validate()){
                            setState(() =>loading=true);
                             result=await _auth.signInemailpassword(email, password);
                            if (result==null)
                            {
                            setState(() {
                              error='Please enter valid email and password';
                              loading=false;
                            });
                           }
                           else{
                             Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => HomeScreen()),
  );
                           }
                         }
                         
                    },
                  ) ,
                  Text(
                    error,
                  ),
                ],
              ),
             
            ),

    )

   );
 } }