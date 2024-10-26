import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shonchoi/app.dart';
import 'package:shonchoi/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(options: const FirebaseOptions(
        apiKey: "AIzaSyBTbO-hrYCRODx0v0qfYa5GtVE3vKpe2vI",
        authDomain: "shonchoi-39.firebaseapp.com",
        projectId: "shonchoi-39",
        storageBucket: "shonchoi-39.appspot.com",
        messagingSenderId: "333196675505",
        appId: "1:333196675505:web:8e8ec456ba11449db21590"));
  }else{
    await Firebase.initializeApp();
  }


  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}
