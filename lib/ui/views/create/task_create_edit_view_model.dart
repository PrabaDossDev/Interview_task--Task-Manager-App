import 'package:flutter/cupertino.dart';
import 'package:interview_task/locator.dart';
import 'package:interview_task/services/shared/preference_service.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';

import '../../../core/enum/view_state.dart';
import '../../../core/model/status.dart';
import '../../../core/model/task.dart';
import '../../../services/api_request/task_request.dart';
import '../base_view_model.dart';

class TaskCreateEditViewModel extends MyBaseViewModel {


   FormFieldController titleController = new FormFieldController(ValueKey("title"),required: true,textCapitalization: TextCapitalization.sentences);
   FormFieldController descriptionController = new FormFieldController(ValueKey("description"),minLines: 4,
     maxLines: 6,
     textInputType: TextInputType.multiline,
     textCapitalization: TextCapitalization.sentences,);

   final _taskService = locator<TaskService>();

   List<StatusModel> statusList = [
     StatusModel(status: "Pending", label: "Pending"),
     StatusModel(status: "Completed", label: "Completed"),
   ];

   StatusModel? selectedStatus;
   bool statusValidate = false;
   final FocusNode statusFocus = FocusNode();

   final taskFormKey = GlobalKey<FormState>();

  bool isEditMode = false;
  Task? _existingTask;
  String status = 'Pending';

  void init(Task? data) async {
    setState(ViewState.Busy);
    if(data != null){
      isEditMode = true;
      _existingTask = data;
      titleController.text = data.title;
      descriptionController.text = data.description ;
      selectedStatus = statusList.where((test)=> test.status == data.status ).first;
    }
    setState(ViewState.Idle);
    notifyListeners();
  }

  void save() async {
    setState(ViewState.Busy);

    bool isFormValid = taskFormKey.currentState!.validate();

    if (selectedStatus == null) {
      statusValidate = true;
      statusFocus.requestFocus();
    }

    if (!isFormValid || selectedStatus == null) {
      setState(ViewState.Idle);
      notifyListeners();
      return;
    }

    final now = DateTime.now().toIso8601String();

    final task = Task(
      id: isEditMode ? _existingTask!.id : generateId(),
      title: titleController.text,
      description: descriptionController.text,
      status: selectedStatus!.status,
      createdAt: isEditMode ? _existingTask!.createdAt : now,
      updatedAt: now,
    );

    if(isEditMode){
      await _taskService.updateTask(task);
    } else {
      await _taskService.addTask(task);
    }

    navigationService.pop();

    setState(ViewState.Idle);
    notifyListeners();

  }

   String generateId() {
     return DateTime.now().microsecondsSinceEpoch.toString();
   }


}