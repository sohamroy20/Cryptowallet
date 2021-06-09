
import 'package:crypto_wallet/net/apimethods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_wallet/ui/ux/AddView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double bitcoin = 0.0;
  double tether = 0.0;
  double ethereum = 0.0;
  
  @override
  void initState() { 
    getValues();
    
  }
  getValues()async{
    bitcoin = await getPrice("bitcoin");
    tether = await getPrice("tether");
    ethereum = await getPrice("ethereum");
    setState(() {
          
        });
  }
  @override

  Widget build(BuildContext context) {
    getValues(String id , double amount)async{
      if(id=="bitcoin")
      {
        return bitcoin*amount;
      }
      else if (id=="tether")
      {
        return tether*amount;
      }else{
        return ethereum*amount;
      }
    }
    
    return Scaffold(
      body:Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.white),
       child: Center(child: StreamBuilder(
         stream: FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser.uid).collection('Coins').snapshots(), 
         // ignore: missing_return
         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) { 
           if(!snapshot.hasData){
             return Center(child: CircularProgressIndicator(),);
           }
           return ListView(
             children:snapshot.data.docs.map((document){
               return Container(
                 child:Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                   Text("Coin Name: ${document.id}"),Text("Price: ${getValues(document.id, document.data()['Amount'])}")
                 ],)
               );
             }).toList()
           );
          },
          
          ),)
    ),
    floatingActionButton: FloatingActionButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> AddView(),),);
    },
    child: Icon(Icons.add,color: Colors.white,),
    backgroundColor: Colors.blue,
    ),
    );
  }
}