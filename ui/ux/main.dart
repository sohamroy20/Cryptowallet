import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'authentication.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'CryptoW',
    home: Authentication(),
    );
    
  }
}


 //https://console.firebase.google.com/u/0/project/crypto-wallet-aaa73/firestore/data~2F