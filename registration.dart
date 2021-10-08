import 'package:flutter/material.dart';
import 'package:smconfapp/utils/constants.dart';
import 'package:smconfapp/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';


class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
    body: CustomScrollView(
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
              Text("Grab your ticket for SMConf 2021",style:TextStyle(fontSize: 22,fontWeight:FontWeight.w200,color: Colors.white))
            ],
          ),
          centerTitle: true,
        ),
          SliverPadding(
          padding: EdgeInsets.all(12),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name *", 
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 16),),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: kTextFieldDecoration)
              ],)   
          )), 
          SliverPadding(
          padding: EdgeInsets.all(12),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email *", 
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 16),),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: kTextFieldDecoration)
              ],)  
          )), 
          SliverPadding(
          padding: EdgeInsets.all(12),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Phone Number *", 
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 16),),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: kTextFieldDecoration)
              ],)  )), 
           SliverPadding(
          padding: EdgeInsets.all(12),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Location *", 
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 16),),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: kTextFieldDecoration)
              ],)  )), 
           SliverPadding(
          padding: EdgeInsets.all(12),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Any Message for the Organizers?", 
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 16),),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  maxLines: 3,
                  decoration: kTextFieldDecoration.copyWith(
                  
                  ))
              ],)  )),

          SliverPadding(
          padding: EdgeInsets.all(12),
          sliver: SliverToBoxAdapter(
            child: ElevatedButton(
              child: Text("Register",
              style: TextStyle(fontSize: 20),),
              onPressed: (){},
            ),)),
      ]  
    ), );
  }
}

