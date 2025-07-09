import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ragdalion_news/constant/constant_textstyle_color.dart';
import 'package:ragdalion_news/home.dart';
import 'package:ragdalion_news/page/login/login_textformfield_widget.dart';
import 'package:ragdalion_news/services/shared_preference.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 211,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Header Image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(color: Color(0xff539df4).withAlpha(220)),
                Positioned(
                  top: 120,
                  left: 30,
                  child: Text(
                    'RAGDANews',
                    style: headline1.copyWith(color: whiteColor),
                  ),
                ),
                Positioned(
                  top: 170,
                  left: 30,
                  child: Text(
                    'Please log into your account',
                    style: regular.copyWith(color: whiteColor, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Email', style: regular),
                  ),
                ),
                LoginTextformfieldWidget(
                  hintText: 'Cth. contoh@gmail.com',
                  prefixIcon: Icons.person,
                ),
                Gap(6),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Password', style: regular),
                  ),
                ),
                LoginTextformfieldWidget(
                  hintText: 'Enter password',
                  prefixIcon: Icons.lock,
                  suffixIcon: Icon(Icons.visibility),
                ),
                Gap(48),
                GestureDetector(
                  onTap: () async {
                    await StorageDevice().saveToken();
                    Get.to(Home());
                  },
                  child: Container(
                    width: double.infinity,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: foundationBlueColor,
                    ),
                    child: Center(
                      child: Text(
                        'Enter',
                        style: regular.copyWith(color: whiteColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
