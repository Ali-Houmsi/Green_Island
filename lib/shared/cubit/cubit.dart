 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/models/password_models.dart';
import 'package:udemy_flutter/modules/Home/home_screen.dart';
import 'package:udemy_flutter/modules/complete_group/complete_Group_screen.dart';
import 'package:udemy_flutter/modules/guied/guid_screen.dart';
import 'package:udemy_flutter/modules/info/info_screen.dart';
import 'package:udemy_flutter/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() :  super(AppInitialStates());
  static AppCubit get(context) => BlocProvider.of(context); 
   int currentIndex = 0;
    List<Widget> screens=[
      HomeScreen(),
      GuidScreen(),
      InfoScreen(),
     Complete_Screen(),
    ];
    List<String> titles=[
    'Home Screen',
    'GuidScreen',
    'InfoScreen',
  'Complete Screen',
    
    ];
    void changeIndex (int index){
      currentIndex=index;
      emit(AppChangeBottomNavBarState());

    }


    void checkPass({
      required int Password,
    }){
     PasswordModel model = PasswordModel (
       Password:Password,
     );
      FirebaseFirestore.instance.collection('Password')
      .doc()
      .set(model.toMap())
      .then((value) {
        //print(value.Password.p1);
        emit(CheckPassword());
      })
      .catchError((error){
        emit(ErrorPassword(error.toString()));

      });
    }
}