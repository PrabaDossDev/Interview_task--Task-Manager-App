
import 'package:interview_task/ui/views/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../core/res/colors.dart';
import '../../../core/res/images.dart';

class SplashPage extends ViewModelBuilderWidget<SplashViewModel> {

  @override
  void onViewModelReady(SplashViewModel viewModel) {
    viewModel.onInit();
    super.onViewModelReady(viewModel);
  }

  @override
  SplashViewModel viewModelBuilder(BuildContext context) => SplashViewModel();

  @override
  Widget builder(BuildContext context, SplashViewModel viewModel, Widget? child) {
      return Scaffold(
        body: Container(
          width: double.infinity,
          color: AppColor.white,
          child: Center(
            child: Image.asset(Images.appLogo, fit: BoxFit.fill, width: 150,),
          )
        )
      );
  }
}