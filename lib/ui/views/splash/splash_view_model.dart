import 'package:flutter/cupertino.dart';
import 'package:interview_task/core/model/helper/db_helper.dart';
import '../../../locator.dart';
import '../../../router.dart';
import '../../../services/api_request/task_request.dart';
import '../../../services/shared/api_model/no_response_exception.dart';
import '../../../services/shared/api_model/request_settings.dart';
import '../../../services/shared/preference_service.dart';
import '../base_view_model.dart';

class SplashViewModel extends MyBaseViewModel {

  @override
  Future onInit() async {

    await locator<PreferenceService>().init();
    await locator<TaskService>().init();

    try {
      Future.delayed(const Duration(milliseconds: 500), () {
       if(preferenceService.getBearerToken().isEmpty) {
         navigationService.popAllAndPushNamed(Routes.login);
       }
       else {
         navigationService.popAllAndPushNamed(Routes.home);
       }
      });

    } catch (ex) {
      debugPrint("EXCEPTION $ex");
    }

    return super.onInit();
  }

  @override
  void handleNoResponse(RequestSettings settings, NoResponseException exception) {
    debugPrint("ViewModel ${exception.message}");
    super.handleNoResponse(settings, exception);
  }

}