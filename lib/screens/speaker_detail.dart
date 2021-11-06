import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smconfapp/data/speaker.dart';

class SpeakerDetail extends StatelessWidget {
  final Speaker speaker;
  const SpeakerDetail({Key? key, required this.speaker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .5,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(speaker.photoUrl!),
                    fit: BoxFit.cover
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon:Icon(Icons.arrow_back_ios, color: Colors.white,)),
                      Row(
                        children: [
                          IconButton(onPressed: (){}, icon:FaIcon(FontAwesomeIcons.globe, color: Colors.white,) ),
                          IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.white,))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .45
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(speaker.name!,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(speaker.title!,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text(speaker.bio!,
                      style: GoogleFonts.poppins(
                        fontSize: 14
                      ),
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

