import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo/data/remote_url.dart';
import 'package:foodigo/features/GetProfile/cubit/get_profile_cubit.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/circle_image.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final dCubit = context.read<GetProfileCubit>();
    return Stack(
      children: [
        const CustomImage(path: KImages.homeAppbarBg),
        Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: ListTile(
            leading: CircleImage(
              image:
                  dCubit.user != null
                      ? RemoteUrls.imageUrl(dCubit.user!.manImage)
                      : KImages.profile,
              size: 48,
            ),
            title: const CustomText(text: 'Welcome', color: whiteColor),
            subtitle: Padding(
              padding: Utils.only(top: 6),
              child: CustomText(
                text:
                    dCubit.user != null
                        ? '${dCubit.user!.fname} ${dCubit.user!.lname}'
                        : 'Guest',
                color: whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            // trailing: CustomImage(
            //   path: KImages.notificationIcon,
            //   color: whiteColor,
            //   width: 24,
            //   height: 24,
            // ),
          ),
        ),
      ],
    );
  }
}
