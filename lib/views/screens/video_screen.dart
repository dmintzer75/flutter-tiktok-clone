import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controllers/video_controller.dart';
import 'package:tiktok_clone/shared/constants.dart';

import 'package:tiktok_clone/theme/custom_fonts.dart';
import 'package:tiktok_clone/theme/custom_theme.dart';
import 'package:tiktok_clone/views/screens/comment_screen.dart';
import 'package:tiktok_clone/views/widgets/circle_animation.dart';

import '../../models/video.dart';
import '../widgets/video_player_item.dart';

class VideoScreen extends StatelessWidget {
  VideoScreen({super.key});
  final videoController = Get.put(VideoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: videoController.videoList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          itemBuilder: (context, index) {
            final data = videoController.videoList[index];
            return Stack(
              children: [
                VideoPlayerItem(
                  videoUrl: data.videoUrl,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    VideoSideBar(
                      data: data,
                      videoController: videoController,
                    ),
                  ],
                )
              ],
            );
          },
        );
      }),
    );
  }
}

class VideoSideBar extends StatelessWidget {
  const VideoSideBar({
    super.key,
    required this.data,
    required this.videoController,
  });
  final Video data;
  final VideoController videoController;
  buildProfile(String profilePhoto) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(1),
          width: 60,
          height: 60,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Pallete.backgroundColor),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image(fit: BoxFit.cover, image: NetworkImage(profilePhoto)),
          ),
        )
      ],
    );
  }

  buildMusicAlbum(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                colors: [
                  Pallete.borderColor,
                  Pallete.backgroundColor,
                ],
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image(
                image: NetworkImage(profilePhoto),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          VideoNameAndCaption(
            data: data,
          ),
          Container(
            width: 100,
            margin: EdgeInsets.only(top: size.height / 6),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildProfile(data.profilePhoto),
                Column(
                  children: [
                    IconButton(
                      onPressed: () => videoController.likevideo(data.id),
                      icon: Icon(
                        Icons.favorite,
                        size: 40,
                        color: data.likes.contains(authController.user.uid) ? Colors.red : Colors.grey,
                      ),
                    ),
                    Text(
                      data.likes.length.toString(),
                      style: CustomFonts.kTitleSmall.copyWith(color: Pallete.backgroundColor),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommentScreen(id: data.id)));
                      },
                      icon: const Icon(
                        Icons.comment,
                        size: 40,
                        color: Pallete.backgroundColor,
                      ),
                    ),
                    Text(
                      data.commentCount.toString(),
                      style: CustomFonts.kTitleSmall.copyWith(color: Pallete.backgroundColor),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        print('share pressed');
                      },
                      icon: const Icon(
                        Icons.reply,
                        size: 40,
                        color: Pallete.backgroundColor,
                      ),
                    ),
                    Text(
                      data.shareCount.toString(),
                      style: CustomFonts.kTitleSmall.copyWith(color: Pallete.backgroundColor),
                    ),
                  ],
                ),
                CircleAnimation(
                  child: buildMusicAlbum(data.profilePhoto),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class VideoNameAndCaption extends StatelessWidget {
  const VideoNameAndCaption({
    super.key,
    required this.data,
  });
  final Video data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.username, style: CustomFonts.kTitleLarge.copyWith(color: Pallete.backgroundColor)),
            Text(data.caption, style: CustomFonts.kBodyLarge.copyWith(color: Pallete.backgroundColor)),
            Row(
              children: [
                const Icon(
                  Icons.music_note,
                  size: 15,
                  color: Pallete.backgroundColor,
                ),
                Text(
                  data.songName,
                  style: CustomFonts.kBodyLarge.copyWith(color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
