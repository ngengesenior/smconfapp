import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class SponsorsWidget extends StatefulWidget {
  const SponsorsWidget({Key? key}) : super(key: key);

  @override
  _SponsorsWidgetState createState() => _SponsorsWidgetState();
}

class _SponsorsWidgetState extends State<SponsorsWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('sponsors').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if(snapshot.hasData){
          return CarouselSlider(
              options: CarouselOptions(height: 400,
                  aspectRatio: 4 / 3,
                  autoPlay: true,
                  enlargeCenterPage: true
              ),
              items: snapshot.data!.docs.map((doc) => Image.network(doc['imageUrl'])).toList()     //carouselImages.map((e) => Image.asset("assets/images/$e")).toList()
          );
        } else if (snapshot.connectionState == ConnectionState.done && !snapshot.hasData) {
          // Handle no data
          return Center(
            child: Text("Cannot display sponsors"),
          );
        } else {
          // Still loading
          return CircularProgressIndicator();
        }

    },
    );
  }
}


Widget buildSponsorsList(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  if (snapshot.hasData) {
    return CarouselSlider(
      options: CarouselOptions(height: 400,
          aspectRatio: 4 / 3,
          autoPlay: true,
          enlargeCenterPage: true
      ),
      items: snapshot.data!.docs.map((doc) => Image.network(doc['imageUrl'])).toList()     //carouselImages.map((e) => Image.asset("assets/images/$e")).toList()
    );
  } else if (snapshot.connectionState == ConnectionState.done && !snapshot.hasData) {
  // Handle no data
  return Center(
  child: Text("Cannot display sponsors"),
  );
  } else {
  // Still loading
  return CircularProgressIndicator();
  }
}


