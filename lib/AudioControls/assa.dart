import 'package:divya_shravya/SideNavbr/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'myaudio.dart';
import 'package:get/get.dart';

import '../BottomNavBar/DashBoard.dart';

class  PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
         GestureDetector(
           onTap:(){} ,
      child: Container(

        width: MediaQuery.of(context).size.width*0.45,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,

          border: Border.all()
        ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Controls(
            icon: Icons.repeat,
          ),
          Controls(
            icon: Icons.skip_previous,
          ),
          //PlayControl(),
          Controls(
            icon: Icons.skip_next,
          ),
          Controls(
            icon: Icons.shuffle,
          ),
        ],
      ),
    ));
  }
}

// class PlayControl extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return
//       Consumer<MyAudio>(
//         builder: (_,myAudioModel,child)=>
//             GestureDetector(
//               onTap: (){
//                 myAudioModel.audioState=="Playing"? myAudioModel.pauseAudio():myAudioModel.playAudio();
//               },
//               child: Container(
//                 height: 30,
//                 width: 30,
//                 decoration: BoxDecoration(
//                   color: primaryColor,
//                   shape: BoxShape.circle,
//                   boxShadow: [
//                     BoxShadow(
//                         color: darkPrimaryColor.withOpacity(0.5),
//                         offset: Offset(5, 10),
//                         spreadRadius: 3,
//                         blurRadius: 10),
//                     BoxShadow(
//                         color: Colors.white,
//                         offset: Offset(-3, -4),
//                         spreadRadius: -2,
//                         blurRadius: 20)
//                   ],
//                 ),
//                 child: Stack(
//                   children: <Widget>[
//                     Center(
//                       child: Container(
//                         margin: EdgeInsets.all(6),
//                         decoration: BoxDecoration(
//                             color: darkPrimaryColor,
//                             shape: BoxShape.circle,
//                             boxShadow: [
//                               BoxShadow(
//                                   color: darkPrimaryColor.withOpacity(0.5),
//                                   offset: Offset(5, 10),
//                                   spreadRadius: 3,
//                                   blurRadius: 10),
//                               BoxShadow(
//                                   color: Colors.white,
//                                   offset: Offset(-3, -4),
//                                   spreadRadius: -2,
//                                   blurRadius: 20)
//                             ]),
//                       ),
//                     ),
//                     Center(
//                       child: Container(
//                         margin: EdgeInsets.all(12),
//                         decoration:
//                         BoxDecoration(color: primaryColor, shape: BoxShape.circle),
//                         child: Center(
//                             child: Icon(
//                               myAudioModel.audioState=="Playing"?Icons.pause: Icons.play_arrow,
//                               size: 10,
//                               color: darkPrimaryColor,
//                             )),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//       );
//   }
// }

class Controls extends StatelessWidget {
  final IconData icon;

  const Controls({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: Colors.deepPurple.withOpacity(0.5),
              offset: Offset(5, 10),
              spreadRadius: 3,
              blurRadius: 10),
          BoxShadow(
              color: Colors.white,
              offset: Offset(-3, -4),
              spreadRadius: -2,
              blurRadius: 20)
        ],
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.5),
                        offset: Offset(5, 10),
                        spreadRadius: 3,
                        blurRadius: 10),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -4),
                        spreadRadius: -2,
                        blurRadius: 20)
                  ]),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration:
              BoxDecoration(color: Colors.green, shape: BoxShape.circle),
              child: Center(
                  child: Icon(
                    icon,
                    size: 15,
                    color: Colors.redAccent,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}