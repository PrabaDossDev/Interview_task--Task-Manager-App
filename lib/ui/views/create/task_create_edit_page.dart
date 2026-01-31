import 'package:flutter/material.dart';
import 'package:interview_task/core/model/status.dart';
import 'package:interview_task/core/res/spacing.dart';
import 'package:stacked/stacked.dart';
import '../../../core/model/task.dart';
import '../../widgets/button.dart';
import '../../widgets/dropdown.dart';
import '../../widgets/edit_text_field.dart';
import 'task_create_edit_view_model.dart';

class TaskCreateEditPage extends ViewModelBuilderWidget<TaskCreateEditViewModel> {

  Task? task;
  TaskCreateEditPage(this.task);

  @override
  void onViewModelReady(TaskCreateEditViewModel viewModel) {
     viewModel.init(task);
    super.onViewModelReady(viewModel);
  }

  @override
  TaskCreateEditViewModel viewModelBuilder(BuildContext context) => TaskCreateEditViewModel();

  @override
  Widget builder(BuildContext context, TaskCreateEditViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.isEditMode ? 'Edit Task' : 'Create Task'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: viewModel.taskFormKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  EditTextField(
                    'Title*',
                    viewModel.titleController,
                    placeholder: 'Enter title',
                    margin: const EdgeInsets.only(bottom: 20),
                  ),

                  EditTextField(
                    'Description',
                    viewModel.descriptionController,
                    placeholder: 'Enter description',
                  ),

                  VerticalSpacing.custom(value: 16),

                  DropDown<StatusModel>(
                    const Key("dStatus"),
                    title: "Status*",
                    hint: "Select status",
                    itemValue: "status",
                    itemText: "label",
                    items: viewModel.statusList,
                    selectedItem: viewModel.selectedStatus,
                    validate: viewModel.statusValidate,
                    errorText: "Status Required",
                    focusNode: viewModel.statusFocus,
                    margin: const EdgeInsets.only(top: 15),
                    onChange: (StatusModel? data) {
                      viewModel.selectedStatus = data;
                      viewModel.statusValidate = false;
                    },
                  ),

                  VerticalSpacing.custom(value: 32),

                  Button(
                    viewModel.isEditMode ? 'Update' : 'Save',
                    key: const Key("update"),
                    onPressed: () => viewModel.save(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}



