import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SMTab{
  final String title;
  final  IconData icon;
  const SMTab({required this.title, required this.icon});
}

final aboutSiliconMountain = """The Silicon Mountain is the burgeoning tech ecosystem (cluster) in Fako Division of Cameroon with epicenter in Buea. The term is a play (phrasal portmanteau) on Silicon Valley and Mount Fako (which is the most dominant feature of Cameroon’s topography and the highest geographical point in West and Central Africa). Home to a plethora of creatives, techies and the fast-growing startups in Cameroon, the Silicon Mountain is arguably the most innovative community in Cameroon Silicon Mountain attracts over 1 billion francs in revenue in to the Cameroonian Economy with over 200+ Startups & Enterprises.
Silicon Mountain is the home to ActivSpaces Tech Hub-the first tech incubator in Cameroon and amongst the first in Africa. The driving philosophy of Silicon Mountain could be summed up as “enabling self-sustaining development based on learning, collaboration and merit via innovation, technology and design.” Silicon Mountain is built on the collaboration of a handful of entities that go about their daily activities to ensure the development of science, technology, engineering, and mathematics as well as the solutions, products and businesses that may emerge from such development. These entities include Academic Institutions like the University of Buea, Community based Organizations like Play with Python, Incubators like ActivSpaces, Startups like Go Groups and the supporting Government Agencies. Each of these entities play a unique and very important role in the development and evolution of Silicon Mountain. Over the years, Silicon Mountain has been able to hone unique capabilities in Innovation, Technology and Design that is comparable to similar outputs from other parts of the world Each year, members of this community organize a conference that seeks to put their technologies, products and services to the limelight. In 2017, the conference attracted over 900+ participants, making it the largest community driven event on technology, innovation and entrepreneurship in Cameroon.
The Silicon Mountain Conference features talks, workshops, panel discussions, demos and networking sessions. The conference gives the participant a perfect opportunity to network and share ideas/opportunities with aspiring billionaires and stars who are making things happen and changing lives from within Silicon Mountain.
This year, the Conference is focused on SHOWCASING the technologies, products and services being cooked up in Silicon Mountain. These technologies, products and services span real estate, healthcare, finance and a myriad others to be discovered.""""";

final tabs =  [
  SMTab(title: "SM", icon: CupertinoIcons.home),
  SMTab(title: "Agenda", icon: CupertinoIcons.calendar),
  SMTab(title: "Speakers", icon: CupertinoIcons.group),
  SMTab(title: "Home", icon: CupertinoIcons.home)
];

final kTextFieldDecoration = InputDecoration(
              //contentPadding: EdgeInsets.only(top: 3),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            labelText: ' ',
                );
