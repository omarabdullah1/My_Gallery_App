import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_gallery_app/constants/end_points.dart';
import 'package:my_gallery_app/data/local/cache_helper.dart';
import 'package:my_gallery_app/data/models/account_model.dart';
import 'package:my_gallery_app/data/models/images_model.dart';
import 'package:my_gallery_app/data/remote/dio_helper.dart';
import 'package:my_gallery_app/presentation/styles/texts.dart';
import 'package:my_gallery_app/presentation/widget/toast.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AccountModel? accountModel;
  ImagesModel? imagesModel;
  String imagePath = '';

  void userLogin(
      {required String email, required String password, required context}) {
    emit(LoginLoadingState());

    DioHelper.postData(
      url: EndPoints.login,
      body: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      log(value.data.toString());
      accountModel = AccountModel.fromJson(value.data);
      fToast.init(context);
      showToast('login successfully');
      emit(LoginSuccessState(accountModel!));
    }).catchError((error) {
      log(error.toString());
      fToast.init(context);
      showToast('Please Check your credentials');
      emit(LoginErrorState(error.toString()));
    });
  }

  void getImages() {
    emit(GetImagesLoadingState());
    DioHelper.getDataWithToken(
            url: EndPoints.getImages,
            token: CacheHelper.sharedPreferences.getString('token')!)
        .then((value) {
      log(value.data.toString());
      imagesModel = ImagesModel.fromJson(value.data);
      emit(GetImagesSuccessState(imagesModel!));
    }).catchError((error) {
      log(error.toString());
      emit(GetImagesErrorState(error.toString()));
    });
  }

  Future<void> pickImage(bool isCamera) async {
    emit(PickImageLoadingState());
    var picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (pickedFile != null) {
      imagePath = '';
      imagePath = pickedFile.path;
      emit(PickImageSuccessState());
      uploadImages();
    } else {
      // log('No image selected.');
      emit(PickImageErrorState());
    }
  }

  Future<void> uploadImages() async {
    emit(UploadImagesLoadingState());

    // Convert image path to a File object
    File file = File(imagePath);

    // Build request body
    FormData formData = FormData.fromMap({
      'img': await MultipartFile.fromFile(
        file.path,
        filename: file.path,
      ),
    });

    // Make API call
    await DioHelper.postDataWithTokenAndFiles(
      url: EndPoints.uploadImages,
      token: CacheHelper.sharedPreferences.get('token').toString(),
      body: formData,
    ).then((value) {
      log(value.data.toString());
      imagesModel = ImagesModel.fromJson(value.data);
      emit(UploadImagesSuccessState(imagesModel!));
      // getImages();
    }).catchError((error) {
      log(error.toString());
      emit(UploadImagesErrorState(error.toString()));
    });
  }
}
