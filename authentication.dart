import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  Authentication({Key key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,
         decoration: BoxDecoration(
           color: Colors.deepPurple,

         ),
         child: Column(
           children: [
             TextFormField(
               controller: _emailField,
               decoration:InputDecoration(hintText: "something@gmail.com",hintStyle:TextStyle(color: Colors.white10),labelText: "Email/Gmail", labelStyle: TextStyle(color: Colors.white10)),
             ),
             TextFormField(
               controller: _passwordField,

               obscureText: true,
               decoration:InputDecoration(hintText: "something1234abc",hintStyle:TextStyle(color: Colors.white10),labelText: "Password", labelStyle: TextStyle(color: Colors.white10)),
             ),
             Container(
               width: MediaQuery.of(context).size.width/1.4,
               height: 42,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),color:Colors.white,),
               child: MaterialButton(onPressed: (){},child: Text("Login"),),

             ),
             
             Container(
               width: MediaQuery.of(context).size.width/1.4,
               height: 42,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),color:Colors.white,),
               child: MaterialButton(onPressed: (){},child: Text("Register"),),
             )

           ],

         ),
       ),
    );
  }
}