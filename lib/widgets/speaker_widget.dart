import 'package:flutter/material.dart';
class SpeakerItem extends StatelessWidget {
  const SpeakerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox.fromSize(child: Image.network("https://images.unsplash.com/photo-1531727991582-cfd25ce79613?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2734&q=80"),size: Size(150, 200),),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Tanero Chris"),
                  SizedBox(height: 5,),
                  Text("Wordpress Guru"),
                  SizedBox(height: 5,),
                  Text("KiffCodes")
                ],
              )

            ],
          ),
          //Separator
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.sports_soccer),
              Text("Building a Startup with Zero Capital")
            ],
          ),
          Center(
            child: ElevatedButton(onPressed: (){},
                child: Text("Show Abstract")),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
