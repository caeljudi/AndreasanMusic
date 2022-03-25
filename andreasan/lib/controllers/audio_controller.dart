import 'package:andreasan/models/song.dart';
import 'package:audioplayer/audioplayer.dart';
import 'package:get/get.dart';

class AudioController extends GetxController {
  AudioPlayer audioPlayer = AudioPlayer();

  Rx<Song>? currentSong;
  Rx<Duration> position = const Duration().obs;

  void playMusic(String url) async {
    await audioPlayer.play(url);
    audioPlayer.onAudioPositionChanged.listen((event) {
      position.value = event;
    });
  }

  void pauseMusic() async {
    await audioPlayer.pause();
  }

  void stopMusic() async {
    await audioPlayer.stop();
  }

  void seekMusic(double duration) async {
    audioPlayer.seek(duration);
  }
}
