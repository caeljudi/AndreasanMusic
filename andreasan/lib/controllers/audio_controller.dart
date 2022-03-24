import 'package:andreasan/models/song.dart';
import 'package:audioplayer/audioplayer.dart';
import 'package:get/get.dart';

class AudioController extends GetxController {
  AudioPlayer audioPlayer = AudioPlayer();

  bool isPlaying = false;
  String currentSong = "";

  void playMusic(String url) async {
    if (isPlaying && currentSong != url) {
      audioPlayer.pause();
      await audioPlayer.play(url);
      currentSong = url;
    } else if (!isPlaying) {
      await audioPlayer.play(url);
      isPlaying = true;
    }
  }
}
