import 'package:flutter/material.dart';

//See More

class seeMore extends StatelessWidget {
  String name;
  seeMore({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(top: 15, bottom: 5),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.white70,
                size: 20,
              )),
        ),
        Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(right: 28, top: 15, bottom: 5),
          child: Text(
            name,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ],
    );
  }
}
