import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:healthhero/src/model/post_model.dart';
import 'package:healthhero/src/theme/app_color.dart';
import 'package:healthhero/src/utils/circle_shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;

class DesignPost extends StatelessWidget {
  const DesignPost({
    Key? key,
    required this.model,
  }) : super(key: key);
  final PostModel model;

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
                  radius: 35,
                  backgroundColor: whiteColor,
                  child: CircleAvatar(
                    radius: 33,
                    backgroundColor: whiteColor,
                    backgroundImage: NetworkImage(model.ownerurl!),
                  ),
                ),
                minLeadingWidth: 8,
                title: Align(
                  alignment: const Alignment(-1.4, 0),
                  child: Text(
                    '${model.username}',
                    style: kBodyTextBodyMediumStyle()
                        .copyWith(color: primaryColor),
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      color: primaryColor,
                    )),
                subtitle: Align(
                  alignment: const Alignment(-1.1, 0),
                  child: Text(
                    timeago.format(model.timestamp!),
                    style: kBodyTextSubtitleStyle()
                        .copyWith(color: primaryColor.withOpacity(0.8)),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              if (model.mediaUrl != null)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                    child: CachedNetworkImage(
                        placeholder: (context, url) => createImageShimmer(),
                        imageUrl: "${model.mediaUrl}"),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 10),
                child: ExpandableText(
                  animationCurve: Curves.easeIn,
                  model.description ?? '',
                  expandText: 'show more',
                  style: kBodyTextSubtitleStyle().copyWith(color: blackColor),
                  maxLines: 2,
                  linkColor: Colors.blue,
                  animation: true,
                  collapseOnTextTap: true,
                  // prefixText: model.username,
                  //onPrefixTap: () => showProfile(username),
                  prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
