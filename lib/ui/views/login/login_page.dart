import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview_task/ui/views/login/login_view_model.dart';
import 'package:stacked/stacked.dart';
import '../../../core/enum/view_state.dart';
import '../../../core/res/colors.dart';
import '../../../core/res/styles.dart';
import '../../widgets/button.dart';
import '../../widgets/edit_text_field.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/tap_outside_unfocus.dart' show TapOutsideUnFocus;

class LoginPage extends StackedView<LoginViewModel> {

  final bool fromMain;
  final String? redirectRoute;

  LoginPage({this.fromMain = true, this.redirectRoute });

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColor.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark));
    super.onViewModelReady(viewModel);
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();

  @override
  Widget builder(BuildContext context, LoginViewModel viewModel, Widget? child) {
  if (viewModel.state == ViewState.Busy) {
    return CircularLoadingWidget(message: "Authenticating...",);
  } else {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: SafeArea(
          child: TapOutsideUnFocus(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 15.0,right: 15.0),
                child: Form(
                  key: viewModel.formKey ,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[

                      Center(
                        child: Text(
                          "Sign In",
                          textScaleFactor: 1,
                          style: AppTextStyle.title1Bold,
                        ),
                      ),

                      EditTextField(
                        "Email",
                        viewModel.emailController,
                        placeholder: "Enter your email",
                        textInputAction: TextInputAction.next,
                        margin: EdgeInsets.only(bottom: 20.0),
                        onChanged: (value) {
                          print("Email: $value");
                        },
                        onSubmitted: (value) {
                        },
                      ),

                      EditTextField.password(
                        "Password",
                        viewModel.passwordController,
                        placeholder: "Enter password",
                        onChanged: (value) {
                          print("Password: $value");
                        },
                      ),

                      Padding(padding: EdgeInsets.only(top: 35)),

                      Button(
                        "Sign In",
                        key: Key("btnSignIn"),
                        onPressed: () => viewModel.login(),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
  }
  }
}
