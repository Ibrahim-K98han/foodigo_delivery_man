import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo_delivery_man/data/remote_url.dart';
import 'package:foodigo_delivery_man/features/GetProfile/cubit/get_profile_cubit.dart';
import 'package:foodigo_delivery_man/features/Login/model/user_response_model.dart';
import 'package:foodigo_delivery_man/utils/constraints.dart';
import 'package:foodigo_delivery_man/utils/k_images.dart';
import 'package:foodigo_delivery_man/utils/utils.dart';
import 'package:foodigo_delivery_man/widget/circle_image.dart';
import 'package:foodigo_delivery_man/widget/custom_image.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  late GetProfileCubit pCubit;

  @override
  void initState() {
    super.initState();
    pCubit = context.read<GetProfileCubit>();
  }

  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      builder:
          (context) => SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                  onTap: () async {
                    Navigator.pop(context);
                    final pickedFile = await _picker.pickImage(
                      source: ImageSource.camera,
                      imageQuality: 80,
                    );
                    if (pickedFile != null) {
                      setState(() {
                        _image = File(pickedFile.path);
                      });
                      pCubit.image(pickedFile.path);
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Gallery'),
                  onTap: () async {
                    Navigator.pop(context);
                    final pickedFile = await _picker.pickImage(
                      source: ImageSource.gallery,
                      imageQuality: 80,
                    );
                    if (pickedFile != null) {
                      setState(() {
                        _image = File(pickedFile.path);
                      });
                      pCubit.image(pickedFile.path);
                    }
                  },
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProfileCubit, User>(
      builder: (context, state) {
        return Center(
          child: Stack(
            children: [
              _image != null
                  ? ClipRRect(
                    borderRadius: Utils.borderRadius(r: 50.0),
                    child: Image.file(
                      _image!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  )
                  : ClipRRect(
                    borderRadius: Utils.borderRadius(r: 50.0),
                    child: CustomImage(
                      path:
                          pCubit.user!.profileImage.isNotEmpty
                              ? RemoteUrls.imageUrl(pCubit.user!.profileImage)
                              : KImages.profile,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
              Positioned(
                right: 2.0,
                bottom: 2.0,
                child: GestureDetector(
                  onTap: () => _pickImage(),
                  child: const CircleAvatar(
                    maxRadius: 12.0,
                    backgroundColor: primaryColor,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: dTextColor,
                      size: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
