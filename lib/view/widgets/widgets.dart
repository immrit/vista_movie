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

class ProfileItem extends StatelessWidget {
  String name;
  IconData icon;
  ProfileItem({
    Key? key,
    required this.name,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 30),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
          color: Colors.white12, borderRadius: BorderRadius.circular(15)),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Container(
          margin: EdgeInsets.only(right: 8),
          child: Text(name,
              style: TextStyle(
                  color: Colors.white70, fontWeight: FontWeight.bold)),
        ),
        Icon(
          icon,
          color: Colors.white70,
        )
      ]),
    );
  }
}
