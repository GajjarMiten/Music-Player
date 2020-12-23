import 'package:flutter/material.dart';
import 'package:musicPlayer/pages/playerpage/player_page.dart';
import 'package:musicPlayer/widgets/controller.dart';
import 'package:musicPlayer/widgets/music_list.dart';
import 'package:musicPlayer/widgets/app_bar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SlidingUpPanel(
          collapsed: Controller(),
          backdropEnabled: true,
          body: CustomScrollView(
            slivers: [
              MyAppbar(),
              MusicList(),
            ],
          ),
          panel: PlayerPage(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "a"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "aa"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "aaa"),
        ],
      ),
    );
  }
}
