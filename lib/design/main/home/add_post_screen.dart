import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shequal/providers/post_providers.dart';
import 'package:shequal/shared/theme.dart';
import 'package:shequal/shared/user_preference_manager.dart';
import 'package:shequal/shared/widget/custom_button.dart';

class AddPostScreen extends StatefulWidget {
  final UserPreferencesManager userPreferencesManager;
  const AddPostScreen({super.key, required this.userPreferencesManager});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  TextEditingController judulController = TextEditingController(text: "");
  TextEditingController contentController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios),
            ),
            CustomButton(
              onPressed: () async {
                bool isSuccess = await Provider.of<PostProviders>(context,
                        listen: false)
                    .addPost(
                        userId: widget.userPreferencesManager
                            .getUser()!
                            .id
                            .toString(),
                        image:
                            _image!,
                        title: judulController.text,
                        content: contentController.text);
                if (isSuccess) {
                  Navigator.pop(context);
                }
              },
              color: kPrimaryColor,
              text: "Unggah",
              textColor: kWhiteColor,
              width: 120,
            )
          ],
        ),
      );
    }

    Widget boxContent() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(right: 28),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kGreyColor,
                    image: const DecorationImage(
                      image: AssetImage("assets/home/profile.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: judulController,
                    decoration: InputDecoration(
                      hintText: "Apa yang ada dipikiranmu?",
                      hintStyle: greyTextStyle.copyWith(
                        fontSize: 16,
                      ),
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 120,
              margin: const EdgeInsets.only(top: 10, bottom: 100),
              child: TextFormField(
                maxLines: null,
                minLines: null,
                expands: true,
                controller: contentController,
                decoration: InputDecoration(
                  hintText: "Ceritakan lebih detail",
                  hintStyle: greyTextStyle.copyWith(
                    fontSize: 20,
                  ),
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget imgStorage() {
      return Container(
        margin: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: 82,
                height: 82,
                margin: const EdgeInsets.only(right: 13),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: kInactiveColor, width: 2),
                ),
                child: Icon(
                  Icons.camera_alt_rounded,
                  color: kInactiveColor,
                  size: 50,
                ),
              ),
            ),
            (_image != null)
                ? Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        width: 82,
                        height: 82,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: kInactiveColor, width: 2),
                          image: DecorationImage(
                            image: FileImage(_image!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(10, -5),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _image = null;
                            });
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: kInactiveColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              color: kGreyColor,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Column(
          children: [
            header(),
            boxContent(),
            imgStorage(),
          ],
        ),
      ),
    );
  }
}
