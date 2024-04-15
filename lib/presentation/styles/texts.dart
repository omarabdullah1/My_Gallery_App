import 'package:flutter/material.dart';
import 'package:my_gallery_app/data/local/cache_helper.dart';

import 'colors.dart';

class Texts {
  static String login = 'Log in';
  static String token = 'token';
  static String name = 'name';
  static String userName = 'User Name';
  static String pleaseEnterUserName = 'Please enter email/username';
  static String password = 'Password';
  static String pleaseEnterPassword = 'Please enter password';
  static String submit = 'Submit';
  static String myGallery = 'My\nGallery';
  static String welcomeHome = 'Welcome\n${CacheHelper.sharedPreferences.getString('name').toString()}';
  static String logout = 'log out';
  static String upload = 'upload';
}

class TextStyles {
  static TextStyle welcomeStyle = const TextStyle(
    fontFamily: 'SegoeUI',
    color: AppColor.black,
    fontSize: 45.0,
    fontWeight: FontWeight.bold,
  );
  static TextStyle loginStyle = const TextStyle(
    fontFamily: 'SegoeUI',
    fontSize: 30.0,
    color: AppColor.textBlack,
  );
  static TextStyle myGalleryStyle = const TextStyle(
    fontFamily: 'SegoeUI',
    fontSize: 50.0,
    color: AppColor.textBlack,
  );
  static TextStyle welcomHomeStyle = const TextStyle(
    fontFamily: 'BalooThambi',
    fontWeight: FontWeight.normal,
    fontSize: 32.0,
    color: AppColor.textBlack,
  );
  static TextStyle logoutStyle = const TextStyle(
    fontFamily: 'BalooThambi',
    fontWeight: FontWeight.normal,
    fontSize: 20.0,
    color: AppColor.textBlack,
  );
  static TextStyle uploadStyle = const TextStyle(
    fontFamily: 'BalooThambi',
    fontWeight: FontWeight.normal,
    fontSize: 20.0,
    color: AppColor.textBlack,
  );
}
