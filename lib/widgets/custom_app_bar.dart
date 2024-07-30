import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helper/ImageConstant.dart';
import '../helper/colorConstant.dart';



class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isSettingsPage;


  const CustomAppBar(
      {key, required this.title, required this.isSettingsPage});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConstant.themeColor,
      centerTitle: false,
      title: Text(title, style:
      const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      iconTheme: IconThemeData(color: Colors.white),
      actions: [IconButton(onPressed:() {
      }, icon:isSettingsPage?  Icon(Icons.settings):Container())],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60.0);
}
class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isSettingsPage;


  const CustomAppBar2(
      {key, required this.title, required this.isSettingsPage});

  @override
  Widget build(BuildContext context) {
    return AppBar(elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      toolbarHeight: 150,
      leadingWidth: 50,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: SvgPicture.asset(ImageConstant.loc),
      ),
      title: Text(title, style:
      const TextStyle(color: Colors.black, fontWeight: FontWeight.w700,fontSize: 24)),
      iconTheme: IconThemeData(color: Colors.white),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: SvgPicture.asset(ImageConstant.hbi),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60.0);
}
