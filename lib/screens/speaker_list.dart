import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smconfapp/data/speaker.dart';
import 'package:smconfapp/widgets/speaker_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SpeakerList extends StatelessWidget {
  const SpeakerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text("SM Conference 2021",style:GoogleFonts.raleway(
                textStyle: Theme.of(context).textTheme.headline5,
                color: Colors.white
            )),
            SizedBox(height: 6,),
            Text("Speakers/Panelist",style:TextStyle(fontSize: 18,fontWeight:FontWeight.w200,color: Colors.white60))
          ],
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('speakers').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
          if(snapshot.hasData){
            return ListView.separated(itemBuilder: (BuildContext context, index){
              Map<String, dynamic> speakerMap = Map<String,dynamic>.from(snapshot.data!.docs[index].data()); //;
              return SpeakerItem(speaker: Speaker.fromJson(speakerMap))
              ;
            },
                separatorBuilder: (BuildContext context, int index) => const Divider(height: 2,), itemCount:snapshot.data!.docs.length);
          } else if (snapshot.connectionState == ConnectionState.done && !snapshot.hasData) {
            // Handle no data
            return const Center(
              child: Text("Cannot display speakers."),
            );
          } else {
            // Still loading
            return const Center(child: const CircularProgressIndicator());
          }
        },
      )
    );
  }
}
