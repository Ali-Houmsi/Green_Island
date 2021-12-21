import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/cubit/cubit.dart';
import 'layout/cubit/states.dart';

class MessengerScreen extends StatelessWidget {
 
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context)=>HomeCubit(),
          child: BlocConsumer< HomeCubit, HomeStates>(
            listener: (BuildContext context,HomeStates state){
              if (state is HomeInitialtState)
              print ('initial State ');
            },
            builder:(BuildContext context,HomeStates state){
              return  Scaffold(
        backgroundColor: Colors.white,
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
                  'Island Green',
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
                  backgroundColor: Colors.blue,
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
                  backgroundColor: Colors.blue,
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
        body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(
                  //       5.0,
                  //     ),
                  //     color: Colors.grey[300],
                  //   ),
                  //   padding: EdgeInsets.all(
                  //     5.0,
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Icon(
                  //         Icons.search,
                  //       ),
                  //       SizedBox(
                  //         width: 15.0,
                  //       ),
                  //       Text(
                  //         'Search',
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 10.0,
                  ),
                  // Container(
                  //   height: 100.0,
                  //   child: ListView.separated(
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: (context, index) => buildStoryItem(),
                  //     separatorBuilder: (context, index) => SizedBox(
                  //       width: 20.0,
                  //     ),
                  //     itemCount: 5,
                  //   ),
                  // ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => buildChatItem(),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 20.0,
                    ),
                    itemCount: 6,
                  ),
                ],
              ),
              

      
       ),
        ),
        //  bottomNavigationBar: CurvedNavigationBar(
        //      key: _bottomNavigationKey,
        //       index: 0,
        //       height: 60.0,
        //     items: <Widget>[
        //        Icon(Icons.home, size: 30),
        //         Icon(Icons.list, size: 30),
        //         Icon(Icons.compare_arrows, size: 30),
        //     ],
        //     ),
       bottomNavigationBar:CurvedNavigationBar(
         backgroundColor: Colors.green,
         onTap: (index){
           print(index);

         },
         items: [
           CurvedNavigationBar(
            index: 0,
               height: 60.0,
             items: <Widget>[
                Icon(Icons.home, size: 30),
                 Icon(Icons.list, size: 30),
                Icon(Icons.compare_arrows, size: 30),
             Icon(Icons.info_rounded, size: 30),

             ],
           ),
         ],
         
       ),
       );
            } ,
                      
          ),
    );
  }

}
  Widget buildChatItem() =>
      Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS923bawOHcna5Gf6ACeBPRWYIjcEeNEf4x0YOCgRvLc2zi66zKBrzCn5LfA37BTRceAL4&usqp=CAU'),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                // child: CircleAvatar(
                //   radius: 7.0,
                //   backgroundColor: Colors.red,
                // ),
              ),
            ],
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' Input The Code ',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children:
                  [
                    Expanded(
                      child: Text(
                        'Enter the 6-digit code ',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Container(
                        width: 7.0,
                        height: 7.0,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    // Text(
                    //   '02:00 pm',
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
        
      );
      

  Widget buildStoryItem() =>
      Container(
        width: 60.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS923bawOHcna5Gf6ACeBPRWYIjcEeNEf4x0YOCgRvLc2zi66zKBrzCn5LfA37BTRceAL4&usqp=CAU'),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 3.0,
                    end: 3.0,
                  ),
                  // child: CircleAvatar(
                  //   radius: 7.0,
                  //   backgroundColor: Colors.red,
                  // ),
                ),
              ],
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              'Abdullah Mansour Ali Mansour',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
