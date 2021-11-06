import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:smconfapp/utils/app_color.dart';

/**
 * Provides a widget to toggle between seeing full text and part
 */
class ExpandableText extends StatefulWidget {
  final String text;
  bool isExpanded = false;

  ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>
    with SingleTickerProviderStateMixin<ExpandableText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 500),
          child: ConstrainedBox(
            constraints: widget.isExpanded
                ? BoxConstraints()
                : BoxConstraints(maxHeight: 80),
            child: Text(
              widget.text,
              softWrap: true,
              overflow: TextOverflow.fade,
              style: TextStyle(letterSpacing: 3),
            ),
          ),
        ),
        widget.isExpanded
            ? TextButton(
                onPressed: () {
                  setState(() {
                    widget.isExpanded = false;
                  });
                },
                child: Text(
                  "READ LESS",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: mainColor),
                ))
            : TextButton(
                onPressed: () {
                  setState(() {
                    widget.isExpanded = true;
                  });
                },
                child: Text(
                  "READ MORE",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: mainColor),
                ))
      ],
    );
  }
}
