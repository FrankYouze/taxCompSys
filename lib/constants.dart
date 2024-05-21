import 'package:flutter/material.dart';

var defaultBackgroundColor = Colors.blue[300];
var appBarColor = Colors.blue[900];
var myAppBar = AppBar(
  backgroundColor: appBarColor,
  title: Text('TAX COMPLIENT SYSTEM',style: TextStyle(color: Colors.white),),
  centerTitle: false,
);
var drawerTextColor = TextStyle(
  color: Colors.white,
);
var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);
var myDrawer = Drawer(
  backgroundColor: Colors.blue[700],
  elevation: 0,
  child: SingleChildScrollView(
    child: Column(
      children: [
        DrawerHeader(
          child: Icon(
            Icons.monetization_on_outlined,
            size: 64,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: tilePadding,
          child: ListTile(
            leading: Icon(Icons.credit_card,color:Colors.white),
            title: Text(
              'REGISTER NEW',
              style: drawerTextColor,
            ),
          ),
        ),
        Padding(
          padding: tilePadding,
          child: ListTile(
            leading: Icon(Icons.monetization_on,color:Colors.white,),
            title: Text(
              'DEPOSIT',
              style: drawerTextColor,
            ),
          ),
        ),
        Padding(
          padding: tilePadding,
          child: ListTile(
            leading: Icon(Icons.money_off,color:Colors.white),
            title: Text(
              'WITHDRAW',
              style: drawerTextColor,
            ),
          ),
        ),
        Padding(
          padding: tilePadding,
          child: ListTile(
            leading: Icon(Icons.logout,color:Colors.white),
            title: Text(
              'L O G O U T',
              style: drawerTextColor,
            ),
          ),
        ),
      ],
    ),
  ),
);
