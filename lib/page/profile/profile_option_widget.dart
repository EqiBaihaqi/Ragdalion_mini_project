import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ragdalion_news/constant/constant_textstyle_color.dart';

class ProfileOptionWidget extends StatelessWidget {
  final Function()? onTap;
  final IconData icon;
  final String title;
  const ProfileOptionWidget({
    super.key,
    this.onTap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 24),
                Gap(8),
                Text(title, style: regular.copyWith(fontSize: 14)),
              ],
            ),
            Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
