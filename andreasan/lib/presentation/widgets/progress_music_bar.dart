import 'package:flutter/material.dart';

class ProgressMusicBar extends StatefulWidget {
  const ProgressMusicBar(
      {Key? key, required this.duration, required this.position})
      : super(key: key);
  final Duration duration;
  final Duration position;

  @override
  State<ProgressMusicBar> createState() => _ProgressMusicBarState();
}

class _ProgressMusicBarState extends State<ProgressMusicBar> {
  @override
  Widget build(BuildContext context) {
    return Slider.adaptive(
      value: widget.position.inSeconds.toDouble(),
      min: 0.0,
      max: widget.duration.inSeconds.toDouble(),
      onChanged: (value) => print(value),
    );
  }
}
