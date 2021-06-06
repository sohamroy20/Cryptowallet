
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> signin(String email,String password) async{
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email,password:password);
    return true;
  }catch(e){
    print(e);
    return false;
  }
}


Future<bool> register(String email,String password) async{
  try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return true;
  }on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('password provided is weak');
  } 
  else if (e.code == 'email-already-in-use') 
  {
    print('Account already exists for that email');
  }
  return false;
} catch(e){
  print(e.toString());
  return false;
}

}
// ignore: missing_return
Future<bool> addCoin(String id, String amount) async{
  try{
    String uid = FirebaseAuth.instance.currentUser.uid;
    var value = double.parse(amount);
    DocumentReference documentReference = FirebaseFirestore.instance.collection('Users').doc(uid).collection('coin').doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async{
      DocumentSnapshot snapshot=await transaction.get(documentReference);
      if (!snapshot.exists){
        documentReference.set({'Amount':value});
        return true;
      }
      double newAmount = snapshot.data()['Amount']+value;
      transaction.update(documentReference,{'Amount':newAmount});
      return true;
    });
  }catch(e){
    return false;
  }

}