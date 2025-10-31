import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo_delivery_man/data/remote_url.dart';
import 'package:foodigo_delivery_man/features/GetProfile/cubit/get_profile_cubit.dart';
import 'package:foodigo_delivery_man/features/Login/model/user_response_model.dart';
import 'package:foodigo_delivery_man/utils/constraints.dart';
import 'package:foodigo_delivery_man/utils/k_images.dart';
import 'package:foodigo_delivery_man/utils/utils.dart';
import 'package:foodigo_delivery_man/widget/circle_image.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final pCubit = context.read<GetProfileCubit>();
    return BlocBuilder<GetProfileCubit, User>(
      builder: (context, state) {
        final img =
            pCubit.state.profileImage.isNotEmpty
                ? RemoteUrls.imageUrl(pCubit.state.profileImage)
                : KImages.profile;
        return Center(
          child: Stack(
            children: [
              CircleImage(image: img, size: 80),
              Positioned(
                right: 2.0,
                bottom: 2.0,
                child: GestureDetector(
                  onTap: () async {
                    final img = await Utils.pickSingleImage();
                    if (img != null && img.isNotEmpty) {
                      pCubit.image(img);
                    }
                  },
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
