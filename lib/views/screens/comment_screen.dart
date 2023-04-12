import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/shared/constants.dart';
import 'package:timeago/timeago.dart' as tago;
import 'package:tiktok_clone/controllers/comment_controller.dart';
import 'package:tiktok_clone/theme/custom_fonts.dart';
import 'package:tiktok_clone/theme/custom_theme.dart';

import '../widgets/text_input_field.dart';

class CommentScreen extends StatelessWidget {
  CommentScreen({super.key, required this.id});
  final String id;

  final TextEditingController textController = TextEditingController();
  final CommentController commentController = Get.put(CommentController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    commentController.updatePostId(id);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    itemCount: commentController.comments.length,
                    itemBuilder: (BuildContext context, int index) {
                      final comment = commentController.comments[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(comment.profilePhoto),
                        ),
                        title: Row(
                          children: [
                            Text(
                              comment.username,
                              style: CustomFonts.kTitleMedium.copyWith(color: Pallete.mainColor),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              comment.comment,
                              style: CustomFonts.kTitleMedium,
                            ),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              tago.format(comment.datePublished.toDate()),
                              style: CustomFonts.kBodySmall.copyWith(color: Colors.black),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '${comment.likes.length} likes',
                              style: CustomFonts.kBodySmall,
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () => commentController.likeComment(comment.id),
                          icon: Icon(
                            comment.likes.contains(authController.user.uid)
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: Colors.red,
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              const Divider(),
              ListTile(
                title: TextInputField(
                  keyboardType: TextInputType.text,
                  labelText: 'Comment',
                  controller: textController,
                  icon: Icons.comment,
                  primaryColor: Pallete.mainFontColor,
                  secondaryColor: Pallete.backgroundColor,
                ),
                trailing: TextButton(
                  child: Text(
                    'Send',
                    style: CustomFonts.kTitleSmall,
                  ),
                  onPressed: () => commentController.postComment(textController.text),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
