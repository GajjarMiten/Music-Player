import 'package:flutter/material.dart';
import 'package:musicPlayer/helpers/theme.dart';
import 'package:musicPlayer/providers/audio_player.dart';
import 'package:musicPlayer/providers/music_provider.dart';
import 'package:provider/provider.dart';

import 'db/db.dart';
import 'pages/homepage/home_page.dart';

void main() {
  DB.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player',
      theme: theme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MusicProvider.init()),
          ChangeNotifierProvider(create: (_) => Player()),
        ],
        child: HomePage(),
      ),
    );
  }
}
