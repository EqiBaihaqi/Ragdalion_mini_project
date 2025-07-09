import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ragdalion_news/constant/constant_textstyle_color.dart';
import 'package:ragdalion_news/controller/profile_controller.dart';
import 'package:ragdalion_news/page/profile/profile_header.dart';
import 'package:ragdalion_news/page/profile/profile_option_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      body: Stack(
        children: [
          ProfileHeader(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 240,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
                color: whiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account Settings',
                      style: regular.copyWith(
                        color: foundationGreyColor,
                        fontSize: 14,
                      ),
                    ),
                    Gap(30),
                    ProfileOptionWidget(
                      icon: Icons.person,
                      title: 'Personal Information',
                    ),
                    ProfileOptionWidget(
                      icon: Icons.lock,
                      title: 'Password & Security',
                    ),
                    ProfileOptionWidget(
                      icon: Icons.attach_money_rounded,
                      title: 'Salary Slip Summary',
                    ),
                    ProfileOptionWidget(
                      icon: Icons.date_range,
                      title: 'Leave Summary',
                    ),
                    ProfileOptionWidget(
                      icon: Icons.access_time_rounded,
                      title: 'Overtime Summary',
                    ),
                    ProfileOptionWidget(
                      icon: Icons.edit_document,
                      title: 'Annual Tax Return PPH2',
                    ),
                    Gap(16),
                    Text(
                      'Other',
                      style: regular.copyWith(
                        color: foundationGreyColor,
                        fontSize: 14,
                      ),
                    ),
                    ProfileOptionWidget(
                      icon: Icons.logout,
                      title: 'Logout',
                      onTap: () {
                        Get.dialog(
                          barrierDismissible: true,
                          Dialog(
                            backgroundColor: whiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: SizedBox(
                              width: 327,
                              height: 348,
                              child: Column(
                                children: [
                                  Gap(24),
                                  Container(
                                    width: 129,
                                    height: 129,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/logout.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gap(32),
                                  Text(
                                    'Logout?',
                                    style: headline1.copyWith(fontSize: 24),
                                  ),
                                  Text(
                                    'Are you sure you want to logout?',
                                    style: regular.copyWith(
                                      fontSize: 16,
                                      color: foundationGreyColor,
                                    ),
                                  ),
                                  Gap(32),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 133,
                                        height: 42,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: whiteColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: regular.copyWith(
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Gap(12),
                                      SizedBox(
                                        width: 133,
                                        height: 42,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                          onPressed: () {
                                            controller.logout();
                                          },
                                          child: Text(
                                            'Logout',
                                            style: regular.copyWith(
                                              color: whiteColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
