import 'package:flutter/material.dart';
import 'package:news/auth.dart';
import 'package:news/signin.dart';

class SignUp extends StatefulWidget
{
 @override
 SignUpState createState()=>SignUpState();
  
}
class SignUpState extends State<SignUp>{
 final AuthService _auth=AuthService();
   final _formkey= GlobalKey<FormState>();
  //text field state
  String error='';
  String email='';
  String password='';
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: new AppBar(
       title: Text("News"),
       actions: <Widget>[
         FlatButton.icon(
           icon: Icon(Icons.person),
           label: Text("Sign In"),
           onPressed: (){} )
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
                                          hintText: 'Your Password',
                                          labelText: 'Password',
                                          labelStyle: TextStyle(color: Colors.black54)
                                      ),
                     obscureText:true,
                    onChanged:(val){
                        setState(()=>password=val );
                    }
                    
                  ),
                    SizedBox(
                    height:20.0
                  ),
                  RaisedButton(
                    child: Text("Sign Up"),
                    onPressed: ()async{
                           dynamic result= await _auth.registeremailpassword(email,password);
                            if (result==null)
                            {
                              setState(() =>error='Please enter valid details');
                            }
                            else
                            {
                               Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => SignIn()),
  );
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