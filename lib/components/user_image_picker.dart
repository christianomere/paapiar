import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File image) onImagePick;

  const UserImagePicker({
    Key? key,
    required this.onImagePick,
  }) : super(key: key);

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    );

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });

      widget.onImagePick(_image!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 80.0,
          backgroundColor: Colors.white,
          backgroundImage: _image != null ? FileImage(_image!) : null,
        ),

        TextButton(
          onPressed: _pickImage,
          child: Text('Que tal uma foto pra começar?',
            style: TextStyle(
              fontFamily: 'SF Pro Text',
              fontSize: 20,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w300,
              height: 1.95,
            ),
          ),
        ),
      ],
    );
  }
}
