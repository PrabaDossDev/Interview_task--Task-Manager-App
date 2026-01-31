
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import '../../core/enum/view_state.dart';
import '../../core/model/base_model.dart';
import '../../locator.dart';
import '../../services/shared/api_base_service.dart';
import '../../services/shared/api_model/error_response_exception.dart';
import '../../services/shared/api_model/no_response_exception.dart';
import '../../services/shared/api_model/request_settings.dart';
import '../../services/shared/preference_service.dart';

abstract class MyBaseViewModel extends BaseViewModel {

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  final PreferenceService preferenceService = locator<PreferenceService>();

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  VGTSBaseViewModel() {
    this.onInit();
  }

  @protected
  @mustCallSuper
  Future onInit() async {
    return true;
  }

  void dispose() => super.dispose();

  Future<T?> request<T extends BaseModel>(RequestSettings settings) async {
    try {
      return await ApiBaseService().request(settings);
    } on ErrorResponseException catch (exception) {
      handleErrorResponse(settings, exception);
    } on NoResponseException catch (exception) {
      handleNoResponse(settings, exception);
    }

    return null;
  }

  Future<List<T>?> requestList<T extends BaseModel>(RequestSettings settings) async {
    try {
      return await ApiBaseService().requestList(settings);
    } on ErrorResponseException catch (exception) {
      handleErrorResponse(settings, exception);
    } on NoResponseException catch (exception) {
      handleNoResponse(settings, exception);
    }

    return null;
  }


  void handleNoResponse(RequestSettings settings, NoResponseException exception) {
    debugPrint(exception.message);
  }

  void handleErrorResponse(RequestSettings settings, ErrorResponseException exception) {
    int length = exception.errors?.length ?? 0;
    String message = exception.error ?? '';
    dialogService.showDialog(title: "Error", description: message);
  }

  void handleException()=> debugPrint("HANDLE EXCEPTION");

}
