part of 'global_cubit.dart';

@immutable
sealed class GlobalState {}

final class GlobalInitial extends GlobalState {}

final class GlobalChangeSelectedType extends GlobalState {}

class LoginLoadingState extends GlobalState {}

class LoginSuccessState extends GlobalState {
  final AccountModel accountModel;

  LoginSuccessState(this.accountModel);
}

class LoginErrorState extends GlobalState {
  final String error;

  LoginErrorState(this.error);
}

class GetImagesLoadingState extends GlobalState {}

class GetImagesSuccessState extends GlobalState {
  final ImagesModel imagesModel;

  GetImagesSuccessState(this.imagesModel);
}

class GetImagesErrorState extends GlobalState {
  final String error;

  GetImagesErrorState(this.error);
}

class PickImageLoadingState extends GlobalState {}

class PickImageSuccessState extends GlobalState {}

class PickImageErrorState extends GlobalState {}

class UploadImagesLoadingState extends GlobalState {}

class UploadImagesSuccessState extends GlobalState {
  final ImagesModel imagesModel;

  UploadImagesSuccessState(this.imagesModel);
}

class UploadImagesErrorState extends GlobalState {
  final String error;

  UploadImagesErrorState(this.error);
}
