import 'package:flutter/material.dart';

import '../Screens/detail_Screen.dart';

//See More

class seeMore extends StatelessWidget {
  String name;
  Function() ontap;
  seeMore({
    Key? key,
    required this.name,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Row(
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
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
        ],
      ),
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

Widget LoginRegisterTextField(
    String nameField,
    IconData icon,
    TextEditingController controller,
    TextInputType textInputType,
    bool obscureText) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: TextField(
      controller: controller,
      textAlign: TextAlign.right,
      obscureText: obscureText,
      keyboardType: textInputType,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: nameField,
        hintStyle: TextStyle(color: Colors.white60),
        prefixIcon: Icon(icon, color: Colors.white60),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}



class itemsView extends StatefulWidget {
   itemsView({
    super.key,
    required this.hi,
    required this.jsonList,
    required this.wi,
  });

  final double hi;
   var jsonList;
  final double wi;

  @override
  State<itemsView> createState() => _itemsViewState();
}

class _itemsViewState extends State<itemsView> {
  @override
  Widget build(BuildContext context) {
  return Container(
  width: double.infinity,
  height: double.infinity,
  padding: EdgeInsets.only(top: widget.hi * .03),
  child: GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 3,
  mainAxisSpacing: 20,
  crossAxisSpacing: 5,
  mainAxisExtent: widget.hi * .25),
  shrinkWrap: true,
  itemCount: widget.jsonList == null ? 0 : widget.jsonList.length,
  itemBuilder: (context, index) {
  return GestureDetector(
  onTap: () {
  Navigator.of(context).push(MaterialPageRoute(
  builder: (context) => DetailScreen(
  image:
  'https://vista.chbk.run/api/files/${widget.jsonList[index]['collectionId']}/${widget.jsonList[index]['id']}/${widget.jsonList[index]['logo']}',
  name: widget.jsonList[index]['name'],
  url: widget.jsonList[index]['url'],
  subtitleUrl: widget.jsonList[index]['subtitle'],
  cats: widget.jsonList[index]['expand_cats'],
  ),
  ));
  },
  child: Container(
  child: Column(
  children: [
  Container(
  width: widget.wi * .3,
  height: widget.hi * .2,
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  image: DecorationImage(
  image: NetworkImage(
  'https://vista.chbk.run/api/files/${widget.jsonList[index]['collectionId']}/${widget.jsonList[index]['id']}/${widget.jsonList[index]['logo']}'),
  fit: BoxFit.cover)),
  ),
  Text(
  widget.jsonList[index]['name'],
  style: TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 15),
  )
  ],
  ),
  ),
  );
  },
  ));
  }
}
