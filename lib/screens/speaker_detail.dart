import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smconfapp/data/speaker.dart';
import 'package:url_launcher/url_launcher.dart';

class SpeakerDetail extends StatelessWidget {
  final Speaker speaker;

  const SpeakerDetail({Key? key, required this.speaker}) : super(key: key);

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url) && url.isNotEmpty) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    String twitterHandle = "";
    String linkedInHandle = "";
    var currentLinkedIn = speaker.linkedIn;
    var currentTwitter = speaker.twitter;
    if (currentTwitter != null && currentTwitter.isNotEmpty) {
      twitterHandle = currentTwitter.split("twitter.com/").last.replaceAll("/", "");
    }
    if(currentLinkedIn != null && currentLinkedIn.isNotEmpty){
      linkedInHandle = currentLinkedIn.split('linkedin.com/in/').last.replaceAll("/", "");
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Hero(
              tag: speaker.name!,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(speaker.photoUrl!),
                      fit: BoxFit.cover),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            )),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: FaIcon(
                                  FontAwesomeIcons.globe,
                                  color: Colors.white,
                                )),
                            IconButton(
                                onPressed: () async {
                                 await _launchInBrowser(speaker.twitter!);
                                },
                                icon: FaIcon(
                                  FontAwesomeIcons.twitter,
                                  color: Colors.white,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .45),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.white),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      speaker.name!,
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      speaker.title!,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      speaker.bio!,
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () async {
                              _launchInBrowser(speaker.linkedIn!);
                            },
                            icon: FaIcon(FontAwesomeIcons.linkedinIn),
                            color: Color(0xFF0077b5)),
                        Text("@$linkedInHandle",
                        style: TextStyle(
                          color: Color(0xFF0077b5)
                        ),)
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () async {
                             await _launchInBrowser(speaker.twitter!);
                            },
                            icon: FaIcon(FontAwesomeIcons.twitter),
                            color: Color(0xFF1DA1F2)),
                        GestureDetector(
                          onTap: () async{
                            await _launchInBrowser(speaker.twitter!);

                          },
                          child: Text("@$twitterHandle",
                          style: TextStyle(
                            color: Color(0xFF1DA1F2)
                          ),),
                        )
                      ],
                    ),
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
