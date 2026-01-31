import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_task/core/model/task.dart';
import 'package:interview_task/locator.dart';
import 'package:interview_task/services/api_request/page_request.dart';
import 'package:interview_task/services/shared/preference_service.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';
import '../../../core/enum/view_state.dart';
import '../../../core/model/service/alert_response.dart';
import '../../../core/res/colors.dart';
import '../../../router.dart';
import '../../../services/api_request/task_request.dart';
import '../../../services/shared/dialog_service.dart';
import '../base_view_model.dart';

class HomeViewModel extends MyBaseViewModel {

  FormFieldController search = FormFieldController(ValueKey("search"));

  List<Task>? _taskList;

  List<Task>? get taskList => search.text.isEmpty ? _taskList : _taskList!.where((element) => element.title.toLowerCase().contains(search.text.toLowerCase())).toList();

  final _taskService = locator<TaskService>();

   init() async {
    setState(ViewState.Busy);
    _taskList = await _taskService.getTasks();
    setState(ViewState.Idle);
    notifyListeners();
  }

  void clearSearchText() {
    search.clear();
    notifyListeners();
  }


   logout() async {
     setState(ViewState.Busy);
    await preferenceService.clearData();
    await locator<TaskService>().clear();
    await navigationService.popAllAndPushNamed(Routes.login);
    setState(ViewState.Idle);
    notifyListeners();
  }

   createTask() async {
    await navigationService.pushNamed(Routes.createTask);
    await init();
  }

  Task? _lastDeletedTask;

  Future<void> deleteTask(Task task) async {
    _lastDeletedTask = task;
    await _taskService.deleteTask(task.id);
    await init();
  }

  Future<void> undoDelete() async {
    if (_lastDeletedTask != null) {
      await _taskService.addTask(_lastDeletedTask!);
      _lastDeletedTask = null;
      await init();
    }
  }

  void onDismissed(Task task,BuildContext context) async {

    await deleteTask(task);

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColor.primary,
          content: const Text('Task deleted'),
          action: SnackBarAction(
            label: 'UNDO',
            textColor: AppColor.white,
            onPressed: () {
              undoDelete();
            },
          ),
        ));
  }

}