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
               DocumentSnapshot password = await FirebaseFirestore.instance.collection('Android').doc('Password').get();
              },
            ),
          ),
        ),
    ),
      );
  }
}
