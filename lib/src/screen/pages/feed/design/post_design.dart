import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:healthhero/src/constants/global.dart';
import 'package:healthhero/src/model/joined_group_model.dart';
import 'package:healthhero/src/model/post_model.dart';
import 'package:healthhero/src/theme/app_color.dart';
import 'package:healthhero/src/utils/circle_shimmer.dart';
import 'package:like_button/like_button.dart';
import 'package:timeago/timeago.dart' as timeago;

class DesignPost extends StatefulWidget {
  const DesignPost({
    Key? key,
    this.model,
    this.jModel,
  }) : super(key: key);
  final PostModel? model;
  final JoinedGroup? jModel;

  @override
  State<DesignPost> createState() => _DesignPostState();
}

class _DesignPostState extends State<DesignPost> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      margin: EdgeInsets.zero,
      child: Container(
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                leading: CircleAvatar(
                  radius: 32,
                  backgroundColor: whiteColor,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: whiteColor,
                    backgroundImage: NetworkImage(
                      widget.model?.ownerurl ?? widget.jModel!.userImg,
                    ),
                  ),
                ),
                title: Text(
                  widget.model?.username ?? widget.jModel!.userName,
                  style:
                      kBodyTextBodyMediumStyle().copyWith(color: primaryColor),
                ),
                trailing: widget.model?.score != null
                    ? Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          color: widget.model!.score! > 0
                              ? primaryForegroundColor
                              : redColor,
                        ),
                        child: widget.model!.score! > 0
                            ? const Text(
                                'Positive',
                                style: TextStyle(color: whiteColor),
                              )
                            : const Text(
                                'Critical Post',
                                style: TextStyle(color: whiteColor),
                              ),
                      )
                    : Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          color: widget.jModel!.score > 0
                              ? primaryForegroundColor
                              : redColor,
                        ),
                        child: widget.jModel!.score > 0
                            ? const Text(
                                'Positive',
                                style: TextStyle(color: whiteColor),
                              )
                            : const Text('Critical Post'),
                      ),
                subtitle: Text(
                  timeago.format(
                      widget.model?.timestamp ?? widget.jModel!.timestamp),
                  style: kBodyTextSubtitleStyle()
                      .copyWith(color: primaryColor.withOpacity(0.8)),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              if (widget.model?.mediaUrl != null ||
                  widget.jModel!.postimgUrl != null)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                    child: CachedNetworkImage(
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => createImageShimmer(),
                        imageUrl: widget.model?.mediaUrl ??
                            widget.jModel!.postimgUrl),
                  ),
                ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 10, 0),
                  child: widget.model != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ExpandableText(
                              animationCurve: Curves.easeIn,
                              'My Hospital is : ${widget.model?.description?.split('**')[0]}\n\nDoctor is : ${widget.model?.description?.split('**')[1]}\n\nDuration is : ${widget.model?.description?.split('**')[2]}\n\nMedicine Taken is : ${widget.model?.description?.split('**')[3]}\n\nSymtoms is : ${widget.model?.description?.split('**')[4]}',
                              expandText: 'show more',
                              style: kBodyTextSubtitleStyle()
                                  .copyWith(color: blackColor),
                              // maxLines: 3,
                              linkColor: Colors.blue,
                              animation: true,
                              collapseOnTextTap: true,
                              // prefixText: model.username,
                              //onPrefixTap: () => showProfile(username),
                              prefixStyle:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              // onHashtagTap: (name) => showHashtag(name),
                              hashtagStyle: const TextStyle(
                                color: Color(0xFF30B6F9),
                              ),
                              //onMentionTap: (username) => showProfile(username),
                              mentionStyle: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                              //onUrlTap: (url) => launchUrl(url),
                              urlStyle: const TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  color: primaryForegroundColor),
                              child: Text(
                                '${sharedPreferences.getString('role')}',
                                style: const TextStyle(
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ],
                        )
                      : ExpandableText(
                          animationCurve: Curves.easeIn,
                          'My Hospital is : ${widget.jModel?.postText.split('**')[0]}\n\nDoctor is : ${widget.jModel?.postText.split('**')[1]}\n\nDuration is : ${widget.jModel?.postText.split('**')[2]}\n\nMedicine Taken is : ${widget.jModel?.postText.split('**')[3]}\n\nSymtoms is : ${widget.jModel?.postText.split('**')[4]}',
                          expandText: 'show more',
                          style: kBodyTextSubtitleStyle()
                              .copyWith(color: blackColor),
                          maxLines: 3,
                          linkColor: Colors.blue,
                          animation: true,
                          collapseOnTextTap: true,
                          // prefixText: model.username,
                          //onPrefixTap: () => showProfile(username),
                          prefixStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          // onHashtagTap: (name) => showHashtag(name),
                          hashtagStyle: const TextStyle(
                            color: Color(0xFF30B6F9),
                          ),
                          //onMentionTap: (username) => showProfile(username),
                          mentionStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                          //onUrlTap: (url) => launchUrl(url),
                          urlStyle: const TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        )),
              LikeButton(
                padding: EdgeInsets.zero,
                size: 50,
                circleColor: const CircleColor(
                    start: Color(0xff00ddff), end: Color(0xff0099cc)),
                bubblesColor: const BubblesColor(
                  dotPrimaryColor: primaryForegroundColor,
                  dotSecondaryColor: Color.fromARGB(255, 204, 0, 204),
                ),
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.favorite,
                    color: isLiked ? primaryForegroundColor : Colors.grey,
                    size: 25,
                  );
                },
                likeCount: Random().nextInt(12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
