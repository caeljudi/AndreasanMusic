import 'dart:ui';

import 'package:andreasan/presentation/widgets/progress_music_bar.dart';
import 'package:flutter/material.dart';

import '../../models/song.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({
    Key? key,
    required this.songName,
    required this.artistName,
    required this.onTap,
    required this.slider,
  }) : super(key: key);
  final String songName;
  final String artistName;
  final Function(bool) onTap;

  final Widget slider;

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}
 
class _MusicPlayerState extends State<MusicPlayer> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          /* const ProgressMusicBar(
            duration: Duration(milliseconds: 0),
            position: Duration(milliseconds: 0),
          ), */
          widget.slider,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.songName),
                  Text(widget.artistName),
                ],
              ),
              InkWell(
                onTap: () => {
                  setState(() {
                    if (_isPlaying) {
                      _isPlaying = false;
                    } else {
                      _isPlaying = true;
                    }
                  }),
                  widget.onTap(_isPlaying),
                },
                child: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
