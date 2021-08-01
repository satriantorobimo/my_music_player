import 'package:flutter/material.dart';
import 'package:my_music_player_app/feature/home/presentation/logic/provider/play_provider.dart';
import 'package:my_music_player_app/router.dart';
import 'package:provider/provider.dart';
import 'core/resources/string.dart';
import 'feature/home/presentation/logic/provider/search_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PlayProvider(),
        )
      ],
      child: MaterialApp(
        title: 'My Music App',
        theme: ThemeData(primaryColor: Colors.black),
        onGenerateRoute: Routers.generateRoute,
        debugShowCheckedModeBanner: false,
        initialRoute: splashRoute,
      ),
    );
  }
}
