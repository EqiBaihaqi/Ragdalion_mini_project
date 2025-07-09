import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ragdalion_news/constant/constant_textstyle_color.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/profile_background.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(color: Color(0xff539df4).withAlpha(220)),
          Positioned(
            top: 110,
            left: 30,
            child: Row(
              children: [
                Icon(Icons.arrow_back, size: 24, color: whiteColor),
                Gap(16),
                Text(
                  'Profile',
                  style: regular.copyWith(
                    fontWeight: FontWeight.bold,
                    color: whiteColor,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 160,
            left: 30,
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Avatar.png'),
                  ),
                ),
                Gap(18),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hasan Waulat',
                      style: headline1.copyWith(
                        fontSize: 24,
                        color: whiteColor,
                      ),
                    ),
                    Text(
                      'Departemen A',
                      style: regular.copyWith(fontSize: 12, color: whiteColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
