import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/theme/custom_fonts.dart';
import 'package:tiktok_clone/theme/custom_theme.dart';
import 'package:tiktok_clone/theme/styles.dart';
import 'package:tiktok_clone/views/screens/confirm_screen.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({super.key});

  showOptionsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          SimpleDialogOption(
            onPressed: () => pickVideo(ImageSource.gallery, context),
            child: Row(
              children: [
                const Icon(Icons.image),
                const SizedBox(width: 10),
                Text(
                  'Gallery',
                  style: CustomFonts.kTitleMedium,
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () => pickVideo(ImageSource.camera, context),
            child: Row(
              children: [
                const Icon(Icons.camera_alt),
                const SizedBox(width: 10),
                Text(
                  'Camera',
                  style: CustomFonts.kTitleMedium,
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.of(context).pop(),
            child: Row(
              children: [
                const Icon(Icons.cancel),
                const SizedBox(width: 10),
                Text(
                  'Cancel',
                  style: CustomFonts.kTitleMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  pickVideo(ImageSource source, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: source);
    if (video != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ConfirmScreen(
            videoFile: File(video.path),
            videoPath: video.path,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => showOptionsDialog(context),
          child: Container(
            height: 50,
            width: 190,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Styles.buttonRadius),
              color: Pallete.mainColor,
            ),
            child: Center(
              child: Text(
                'Add Video',
                style: CustomFonts.kTitleLarge.copyWith(
                  color: Pallete.backgroundColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
