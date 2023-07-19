// ignore_for_file: unused_field, must_be_immutable, unused_local_variable, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:chat/core/constants.dart';
import 'package:chat/core/widgets/customSpace.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
 const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _file;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSpace(height: 48, width: double.infinity),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                  radius: 42,
                  backgroundColor: Colors.grey.withOpacity(0.5),
                  backgroundImage: _file!=null?  FileImage(_file!) :null
                  ),
            ),
            GestureDetector(
              onTap: () {
                showBottomSheet(
                  context: context,
                  builder: (context) {
                    return BottomSheet(
                        constraints: const BoxConstraints(
                          minWidth: 300,
                          maxWidth: 400,
                          maxHeight: 100,
                        ),
                        backgroundColor: Colors.white70,
                        onClosing: () {
                          Navigator.pop(context);
                        },
                        builder: (context) {
                          return Column(
                            children: [
                              TextButton.icon(
                                onPressed: () async {
                                  final takePhoto = await ImagePicker()
                                      .pickImage(source: ImageSource.camera);
                                  if (takePhoto != null) {
                                    setState(() {
                                      _file = File(takePhoto.path);
                                    });
                                  }
                                },
                                icon: const Icon(Icons.camera_alt_rounded),
                                label: Text(
                                  'Take a Photo',
                                  style: TextStyle(color: kAppColor),
                                ),
                              ),
                              TextButton.icon(
                                onPressed: () async {
                                  final galleryImage = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);
                                  if (galleryImage != null) {
                                    setState(() {
                                      _file = File(galleryImage.path);
                                    });
                                  }
                                },
                                icon: const Icon(Icons.photo),
                                label: Text(
                                  'UpLoad from Gallery',
                                  style: TextStyle(color: kAppColor),
                                ),
                              ),
                            ],
                          );
                        });
                  },
                );
              },
              child: const Icon(
                Icons.camera_alt_rounded,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
