import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class SponsorsPartnersWidget extends StatefulWidget {
  final String collectionName;
  const SponsorsPartnersWidget({Key? key,required this.collectionName}) : super(key: key);

  @override
  _SponsorsPartnersWidgetState createState() => _SponsorsPartnersWidgetState();
}

class _SponsorsPartnersWidgetState extends State<SponsorsPartnersWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection(widget.collectionName).snapshots(),
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


