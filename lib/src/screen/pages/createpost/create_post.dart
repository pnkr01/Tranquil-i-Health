import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_textfield/widget/social_text_field_controller.dart';
import 'package:get/get.dart';
import 'package:healthhero/src/constants/global.dart';
import 'package:healthhero/src/screen/pages/createpost/controller/create_post_controller.dart';
import 'package:healthhero/src/theme/app_color.dart';
import 'package:healthhero/src/widgets/app_bar.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  PlatformFile? pickedFile;
  handleFileUpload() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        pickedFile = result.files.first;
      });
    } else {
      showSnackBar('No Image selected', blackColor, whiteColor);
    }
  }

  UploadTask? uploadTask;
  bool showProgress = false;

  Future uploadFile() async {
    setState(() {
      showProgress = !showProgress;
    });
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);
    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    printMe('url', urlDownload);
    return urlDownload;
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CreatePostController>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                backgroundColor: primaryForegroundColor,
              ),
              onPressed: () {
                if (pickedFile != null) {
                  uploadFile().then((url) {
                    printMe('url of image picked', url);
                    controller.postbutton(url);
                    setState(() {
                      showProgress = !showProgress;
                    });
                  });
                }
              },
              child: Text('Post', style: kBodyTextSubtitleStyle()),
            ),
          )
        ],
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.close,
            color: blackColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 8),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(80)),
                    child: CachedNetworkImage(
                      imageUrl: controller.getUserProfile(),
                      width: 45,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pawan Kumar', style: kBodyTextSubtitleStyle1()),
                      Obx(
                        () => DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isDense: true,
                            value: controller.selectedList.value,
                            items: controller.itemList
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item,
                                          style: kBodyTextSubtitleStyle()
                                              .copyWith(color: blackColor)),
                                    ))
                                .toList(),
                            onChanged: ((value) =>
                                controller.changeIdx(value.toString())),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 230,
                child: DefaultSocialTextFieldController(
                  detectionPresentationMode:
                      DetectionPresentationMode.above_text_field,
                  focusNode: FocusNode(),
                  //scrollController: _scrollController,
                  textEditingController: controller.postController,
                  detectionBuilders: const {
                    // DetectedType.mention: (context) => mentionContent(height),
                    // DetectedType.hashtag: (context) => hashtagContent(height),
                    // DetectedType.url: (context) => urlContent(height)
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        TextField(
                          cursorColor: primaryForegroundColor,
                          scrollPhysics:
                              const ClampingScrollPhysics(), //Use this for unnecessary scroll bounces
                          // scrollController: _scrollController,
                          focusNode: FocusNode(),
                          controller: controller.writePostController,
                          // expands: true,
                          maxLines: 20,
                          minLines: 10,
                          decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(),
                              enabledBorder: const UnderlineInputBorder(),
                              focusColor: primaryColor,
                              hintText: "Share your thoughts",
                              hintStyle: kBodyTextSubtitleStyle1()
                                  .copyWith(color: greyColor)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.camera),
                  ),
                  IconButton(
                    onPressed: () {
                      handleFileUpload();
                    },
                    icon: const Icon(Icons.photo),
                  ),
                ],
              ),
              if (pickedFile != null)
                SizedBox(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Image.file(
                        File(pickedFile!.path!),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              if (showProgress)
                StreamBuilder<TaskSnapshot>(
                    stream: uploadTask?.snapshotEvents,
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        final data = snapshot.data!;
                        double progress =
                            data.bytesTransferred / data.totalBytes;
                        return SizedBox(
                          height: 30,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                width: double.infinity,
                                height: 20,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: LinearProgressIndicator(
                                    value: progress,
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            Color(0xff00ff00)),
                                    backgroundColor: const Color(0xffD6D6D6),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  '${(100 * progress).roundToDouble()}',
                                  style: const TextStyle(color: whiteColor),
                                ),
                              )
                            ],
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    }))
            ],
          ),
        ),
      ),
    );
  }
}
