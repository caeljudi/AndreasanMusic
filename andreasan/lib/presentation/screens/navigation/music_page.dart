import 'dart:async';

import 'package:andreasan/controllers/audio_controller.dart';
import 'package:andreasan/controllers/upload_controller.dart';
import 'package:andreasan/controllers/user_controller.dart';
import 'package:andreasan/presentation/widgets/music_card.dart';
import 'package:andreasan/presentation/widgets/music_player.dart';
import 'package:audioplayer/audioplayer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../models/song.dart';
import '../../widgets/progress_music_bar.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final UserController userController = Get.find<UserController>();
  final UploadController controller = Get.find<UploadController>();
  final AudioController audioController = Get.find<AudioController>();
  late StreamSubscription<DocumentSnapshot<Object?>> stream;

  List<Song>? songList;

  Song? currentSong;

  @override
  void initState() {
    stream = userController.getUserDocuments().listen((event) {
      setState(() {
        songList = (event['songs'] as List)
            .map(
              (e) => Song(fullPath: e['fullPath'] ?? "", name: e['name'] ?? ""),
            )
            .toList();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    stream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              ...songList!
                  .map(
                    (Song song) => Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        MusicCard(
                          song: song,
                          onTap: () async {
                            setState(() {
                              currentSong = song;
                            });
                          },
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MusicPlayer(
            slider: Obx(
              () => ProgressMusicBar(
                duration: audioController.audioPlayer.duration,
                position: audioController.position.value,
              ),
            ),
            artistName: "Calimero",
            songName: currentSong != null ? currentSong!.name : "",
            onTap: (bool isPlaying) async {
              if (isPlaying) {
                String downloadURL = await FirebaseStorage.instance
                    .ref(currentSong!.fullPath)
                    .getDownloadURL();
                audioController.playMusic(downloadURL);
              } else {
                audioController.pauseMusic();
              }
            },
          ),
        ),
      ],
    );
  }
}
