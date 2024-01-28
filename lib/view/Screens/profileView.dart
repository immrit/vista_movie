import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    var wi = MediaQuery.of(context).size.width;
    var hi = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("پروفایل"),
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
        backgroundColor: Colors.black.withOpacity(.1),
      ),
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: hi * .2,
            margin: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white12, borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(maxRadius: hi * .06),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "username",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(onPressed: () {}, child: Text("ویرایش پروفایل"))
                  ],
                )
              ],
            ),
          ),
          ProfileItem(
            name: 'حمایت مالی از ویستا مووی',
            icon: Icons.money,
          ),
          ProfileItem(
            name: 'برگزیده ها',
            icon: Icons.favorite,
          ),
          ProfileItem(
            name: 'نشان شده ها',
            icon: Icons.bookmark,
          ),
          ProfileItem(
            name: 'درخواست ها',
            icon: Icons.list_sharp,
          ),
          ProfileItem(
            name: 'درباره ما',
            icon: Icons.info,
          ),
        ],
      ),
    );
  }
}
