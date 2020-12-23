import 'dart:io';

import 'package:flutter/material.dart';

class AlbumArt extends StatelessWidget {
  final String path;

  AlbumArt(this.path);

  @override
  Widget build(BuildContext context) {
    return (path != null)
        ? Image.file(File(path))
        : Icon(
            Icons.music_note,
            color: Colors.white,
          );
  }
}
