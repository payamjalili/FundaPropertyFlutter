import 'package:flutter/material.dart';
import 'package:funda_property_flutter/constants.dart';

class MediaButton extends StatelessWidget {
  final String title;
  final int? count;
  final IconData icon;

  const MediaButton({
    Key? key,
    required this.title,
    required this.icon,
    this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: defaultPadding / 1.5),
      child: Row(
        children: [
          Icon(
            this.icon,
            color: Colors.blue,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: defaultPadding / 5,
              right: defaultPadding / 8,
            ),
            child: Text(this.title),
          ),
          if (this.count != null)
            Text(
              this.count.toString(),
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
              ),
            ),
        ],
      ),
    );
  }
}
