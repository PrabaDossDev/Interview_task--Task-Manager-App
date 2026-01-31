import 'package:flutter/cupertino.dart';
import 'package:interview_task/services/shared/toast_service.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';
import '../../../core/enum/view_state.dart';
import '../../../locator.dart';
import '../../../router.dart';
import '../base_view_model.dart';

class LoginViewModel extends MyBaseViewModel {

  EmailFormFieldController emailController = new EmailFormFieldController(const Key("email"),requiredText: "Please enter valid Email");
  PasswordFormFieldController passwordController = new PasswordFormFieldController(const Key("password"),requiredText: "Please enter valid Password");

  final formKey = GlobalKey<FormState>();

   login() async {
    setState(ViewState.Busy);
    if (formKey.currentState!.validate()) {
      if(emailController.text == "prabatest@gmail.com" && passwordController.text == "Prabatest@123"){
        preferenceService.setBearerToken(emailController.text);
        navigationService.pushReplacementNamed(Routes.home);
      } else {
        locator<ToastService>().showText(text:"Please enter the correct details");
      }
    }
    setState(ViewState.Idle);
  }
}
