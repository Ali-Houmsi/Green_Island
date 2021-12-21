import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:udemy_flutter/modules/info/info_screen.dart';
import 'package:udemy_flutter/modules/opt_text/opt_text_screen.dart';
class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
            
        // ),
    body:Padding(
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
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                         Navigator.push<void>( context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>OptText(),
                          ));
                      },
                      child: buildChatItem()),
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