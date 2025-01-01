// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_super_parameters

import 'package:flutter/material.dart';

class AppBarCustom extends AppBar {
  AppBarCustom(
  {Key? key, Function? onClickBack, Widget? title, IconData? iconData, TabBar? bottom, List<Widget>? actions, double xRadius = 0})
  : super(
      key: key,
      leading: (onClickBack != null && iconData != null)
        ? IconButton(
            icon: Icon(iconData),
            onPressed: () => onClickBack(),
          )
        : null, 
      title: title,
      bottom: bottom,
      titleSpacing: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      actions: actions,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50),
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(xRadius)),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 6, 134, 156),
              Color.fromARGB(255, 105, 147, 155),
              // Color.fromARGB(255, 248, 246, 110),
            ],
          ),
        ),
      ),
    );
}
