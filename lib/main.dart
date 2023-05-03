import 'package:flutter/material.dart';
import 'package:news_api_json_app/screen/provider/news_provider.dart';
import 'package:news_api_json_app/screen/view/news_screen.dart';
import 'package:provider/provider.dart';
void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => homeProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => home_screen(),
        },
      ),
    ),
  );
}
