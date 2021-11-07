import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smconfapp/data/speaker.dart';
class SpeakerItem extends StatelessWidget {
  final Speaker speaker;
  const SpeakerItem({Key? key,required this.speaker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
   return Card(
     child: Row(
        children: [
          Hero(
            tag: speaker.name!,
            child: CircleAvatar(
              backgroundImage: NetworkImage(speaker.photoUrl!),
            radius: 50,),
          ),
          SizedBox(width: 5,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(speaker.name!),
                SizedBox(height: 4,),
                (speaker.title) != null? Container(

                    child: Text(speaker.title!)):Text(""),

              ],
            ),
          ),
          IconButton(onPressed: (){}, icon:FaIcon(FontAwesomeIcons.linkedinIn),
          color: Color(0xFF0077b5),),
          IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.twitter,
            color: Color(0xFF1DA1F2),))

        ],
      ),
   );
    



      /*Container(
      child: Row(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(speaker.imageUrl),
          ),
          Column(children: [
            Text(speaker.name)
          ],)
        ],
      ),
    );*/
  }
}

class SpeakerWidget extends StatelessWidget {
  final Speaker speaker;
  const SpeakerWidget({Key? key,required this.speaker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(speaker.photoUrl!))
          ),
        ),
        SizedBox(height: 4,),
        Text(speaker.name!)
      ],
    );
  }
}

