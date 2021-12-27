import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:udemy_flutter/modules/info/info_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome Credit Card Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OptText(title: 'Awesome Credit Card Demo'),
    );
  }
}

class OptText extends StatefulWidget {
  OptText({Key?key, this.title}) : super(key: key);
  final String ? title;

  @override
  _OptTextState createState() => _OptTextState();
}

class _OptTextState extends State<OptText> {
  get firestoreInstance => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
         scrollDirection: Axis.horizontal,
              child: Center(
          child: Container(
            // margin: EdgeInsets.symmetric(
              //     horizontal: 10.0,
              //   ),
                child: OTPTextField(
              length: 8,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldWidth: 40,
              fieldStyle: FieldStyle.box,
              outlineBorderRadius: 20,
              style: TextStyle(fontSize: 17),
              onChanged: (pin) {
                print("Changed: " + pin);
              },
              onCompleted: (pin) async {
                
                print("Completed: " + pin);
   
//var document2=document.collection('Android').doc('Password').get();
var document =  FirebaseFirestore.instance;


   if(document == null)
        print("the firebase didnt intialize");
else{

    var result = await document.collection("Android").doc("Password").get();
       
                 print(result);
                 var x=result.data();
                 print(x);
  
          List<dynamic>? y= x!['Password'] as List<dynamic>?;  
              if(y== null)
        print('nulllllllllllllllllllll');

        else  {
          y!.forEach((value){
            print(pin.runtimeType + value);
              if(pin.compareTo(value)==0){
           print ('success');
          }
         // print('  false number');
        }
        );
        }
}

  //     print(result.data());
              
              
              
           } ),
          ),
        ),
    ),
      );
  }
}

    // x!.forEach((value,key) {
      //   //key==Password
      //     // if(pin == value){

      //     // print(value);
      //     // print('success');
      //     // }
      //     // print('عذرا الرقم خاطئ');
      //   },
      //); 







         //   DocumentSnapshot password = await FirebaseFirestore.instance.collection('Android').doc('Password').get();
  //              firestoreInstance.collection("Android").get().then((querySnapshot) {
  //   querySnapshot.docs.forEach((result) {
  //     print(result.data());
  //   });
  // });
  ////////////////////////////////////
  //  var result = await firestoreInstance
  //     .collection("Android")
  //     .where("Password", whereIn: ["22222222"])
  //     .get();
  // result.docs.forEach((res) {
  //   print('this is '+ res.data());
  // });
  /////////////////
  //  var result = await firestoreInstance
  //     .collection("Android")
  //     .where("Passwords", isEqualTo: "33333333")
      
  //     .get();
  // result.docs.forEach((res) {
  //   print(res.data());
  // });