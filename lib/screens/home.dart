import 'package:flutter/cupertino.dart';
import 'package:smconfapp/utils/constants.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("About Silicon Mountain",
            style: CupertinoTheme.of(context).textTheme.navTitleTextStyle
          ),
          SizedBox(height: 10,),
          Text(aboutSiliconMountain)
        ]
      ),
    );
  }
}
