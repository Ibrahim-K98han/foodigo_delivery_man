import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo_delivery_man/data/remote_url.dart';
import 'package:foodigo_delivery_man/features/GetProfile/cubit/get_profile_cubit.dart';
import 'package:foodigo_delivery_man/presentation/core/routes/route_names.dart';
import 'package:foodigo_delivery_man/utils/constraints.dart';
import 'package:foodigo_delivery_man/utils/k_images.dart';
import 'package:foodigo_delivery_man/utils/utils.dart';
import 'package:foodigo_delivery_man/widget/custom_image.dart';
import 'package:foodigo_delivery_man/widget/custom_text_style.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final pCubit = context.read<GetProfileCubit>();
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFFFF8), Color(0xFFFEFEDD)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Utils.verticalSpace(12.0),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: Utils.only(left: 16, top: 30, bottom: 10),
              child: const CustomText(
                text: 'Profile',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Utils.verticalSpace(12.0),

          // ClipRRect(
          //   borderRadius: BorderRadiusGeometry.circular(50),
          //   child: CustomImage(
          //     path: RemoteUrls.imageUrl(pCubit.user!.manImage),
          //     width: 60,
          //     height: 60,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CustomImage(
              path:
                  pCubit.user?.profileImage != null &&
                          pCubit.user!.profileImage.isNotEmpty
                      ? RemoteUrls.imageUrl(pCubit.user!.profileImage)
                      : KImages.profile,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),

          Utils.verticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: '${pCubit.user!.fname} ${pCubit.user!.lname}',
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
              Utils.horizontalSpace(8),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.editProfileScreen);
                },
                child: const CustomImage(
                  path: KImages.editIcon,
                  color: Color(0xFF46D993),
                  height: 18,
                  width: 18,
                ),
              ),
            ],
          ),
          Utils.verticalSpace(2),
          CustomText(
            text:
                pCubit.user?.profileImage != null &&
                        pCubit.user!.profileImage.isNotEmpty
                    ? pCubit.user!.email
                    : 'example@gmail.com',
            color: sTxtColor,
          ),
          Utils.verticalSpace(20),
        ],
      ),
    );
  }
}
