import 'package:flutter/material.dart';

import '../../models/song.dart';

class MusicCard extends StatelessWidget {
  const MusicCard({Key? key, required this.song, required this.onTap})
      : super(key: key);
  final Song song;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8), 
        ),
        child: Row(
          children: [
            const Icon(Icons.music_note),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(song.name),
                  const Icon(Icons.favorite),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
