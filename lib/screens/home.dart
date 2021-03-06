import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smconfapp/data/speaker.dart';
import 'package:smconfapp/sample_data/sample_data.dart';
import 'package:smconfapp/utils/app_color.dart';
import 'package:smconfapp/utils/constants.dart';
import 'package:smconfapp/widgets/speaker_widget.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          stretch: true,
          pinned: true,
          floating: true,
          expandedHeight: 100,
          toolbarHeight: 60,
          title: Column(
            children: [
              Text("SM Conference 2021",style:GoogleFonts.raleway(
                textStyle: Theme.of(context).textTheme.headline5,
                color: Colors.white
              )),
              SizedBox(height: 6,),
              Text("The Show Case",style:TextStyle(fontSize: 18,fontWeight:FontWeight.w200,color: Colors.white60))
            ],
          ),
          centerTitle: true,
        ),
        SliverPadding(
          padding: EdgeInsets.only(left: 8.0,right: 8.0),
          sliver: SliverToBoxAdapter(
            child: Text(aboutSiliconMountain,
            style: TextStyle(letterSpacing:3),),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(left: 16,right: 16,top: 8),
          sliver: SliverToBoxAdapter(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white,
                  onPrimary: mainColor,textStyle: Theme.of(context).textTheme.bodyText2 ),
              child: Text("Video tour",),
              onPressed: (){},
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(16.0),
          sliver: SliverToBoxAdapter(
            child: ElevatedButton(
              child: Text("Grab a Ticket",),
              onPressed: (){},
            ),
          ),
        ),

        SliverPadding(
          padding: EdgeInsets.all(16.0),
          sliver: SliverToBoxAdapter(
            child: Text("Speakers",
            textAlign: TextAlign.center,
            style: GoogleFonts.raleway(color: mainColor,
            textStyle: Theme.of(context).textTheme.headline5),),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 120,
            child: ListView.separated(itemBuilder: (context,index){
              return SpeakerWidget(speaker: speakers[index]);
            },itemCount: speakers.length,
              separatorBuilder: (context,index) {
              return SizedBox(width: 10,);
              },
            scrollDirection: Axis.horizontal,shrinkWrap: true,),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(16.0),
          sliver: SliverToBoxAdapter(
            child: Text("Sponsors",
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(color: mainColor,
                  textStyle: Theme.of(context).textTheme.headline5),),
          ),
        )

      ],
    );
  }
}
