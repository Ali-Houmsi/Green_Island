
      import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/modules/Home/home_screen.dart';
import 'package:udemy_flutter/modules/complete_group/complete_Group_screen.dart';
import 'package:udemy_flutter/modules/guied/guid_screen.dart';
import 'package:udemy_flutter/modules/info/info_screen.dart';
import 'package:udemy_flutter/modules/opt_text/opt_text_screen.dart';
import 'package:udemy_flutter/shared/cubit/cubit.dart';
import 'package:udemy_flutter/shared/cubit/states.dart';
class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  //  int _page = 0;
   
  //GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context) =>AppCubit(),

          // ignore: missing_required_param
          child: BlocConsumer<AppCubit,AppStates>(
            listener: (BuildContext context ,AppStates state){
              if(state is CheckPassword){
                 Navigator.push<void>( context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>Complete_Screen(),
                          ));
              }
            },
             builder: (BuildContext context ,AppStates state){
               AppCubit cubit= AppCubit.get(context);

                return   Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleSpacing: 20.0,
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS923bawOHcna5Gf6ACeBPRWYIjcEeNEf4x0YOCgRvLc2zi66zKBrzCn5LfA37BTRceAL4&usqp=CAU'),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      cubit.titles[cubit.currentIndex],
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                    icon: CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Colors.lightGreen,
                      child: Icon(
                        Icons.add_comment,
                        size: 16.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Colors.lightGreen,
                      child: Icon(
                        Icons.edit,
                        size: 16.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              
            ),
   ///مشان تكون السكرين بناءً على يلي بكبس عليها 
      body:cubit.screens[cubit.currentIndex],
         //CurvedNavigationBar
         bottomNavigationBar:BottomNavigationBar(
             backgroundColor: Colors.green,
        type:BottomNavigationBarType.fixed,
        currentIndex: cubit.currentIndex,
             onTap: (index)
             {
               setState(()
               {
                 cubit.changeIndex(index);
                 }
               );
               //print(index); 
             },
             items: [
        
                    BottomNavigationBarItem(icon:Icon(
                    Icons.home
                    ),
                     label:'Home'
                     ),
                       BottomNavigationBarItem(icon:Icon(
                    Icons.list,
                    ),
                     label:'Guid'
                     ),
                       BottomNavigationBarItem(icon:Icon(
                    Icons.compare_arrows
                    ),
                     label:'Complete Group'
                     ),
                       BottomNavigationBarItem(icon:Icon(
                    Icons.info_rounded
                    ),
                     label:'Information'
                     ),
  ]  
         ),
             
             
      );
             },

           
          ),
    );
    
  } 
}