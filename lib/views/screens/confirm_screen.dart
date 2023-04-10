import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({super.key, required this.videoFile, required this.videoPath});
  final File videoFile;
  final String videoPath;

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(0.8);
    controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              child: VideoPlayer(controller),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
