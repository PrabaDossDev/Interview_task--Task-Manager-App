import 'package:interview_task/core/enum/view_state.dart';
import 'package:interview_task/core/model/task.dart';
import 'package:interview_task/core/res/colors.dart';
import 'package:interview_task/core/res/images.dart';
import 'package:interview_task/core/res/spacing.dart';
import 'package:interview_task/core/res/styles.dart';
import 'package:interview_task/locator.dart';
import 'package:interview_task/ui/views/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:interview_task/ui/widgets/loading_widget.dart';
import 'package:stacked/stacked.dart';
import '../../../core/model/service/alert_response.dart';
import '../../../router.dart';
import '../../../services/api_request/task_request.dart';
import '../../../services/shared/dialog_service.dart';
import '../../widgets/edit_text_field.dart';

class HomePage extends StackedView<HomeViewModel> {

  @override
  void onViewModelReady(HomeViewModel viewModel) {
     viewModel.init();
    super.onViewModelReady(viewModel);
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
      return Scaffold(
        backgroundColor: AppColor.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primary,
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            viewModel.createTask();
          },
        ),
        appBar: AppBar(
          title: Text("Tasks",style: AppTextStyle.title3Medium.copyWith(color: AppColor.header,fontSize: 20),),
          actions: [

            InkWell(
              onTap: (){
               viewModel.logout();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.logout_outlined,size: 20,),
              ),
            )
          ],
        ),

        body: viewModel.state == ViewState.Busy ? LoadingWidget() :
        RefreshIndicator(
        onRefresh: () async {
        await viewModel.init();
        },
          child: ListView(
            children: [

              VerticalSpacing.d10px(),

              //searchbar
              Container(
                margin: EdgeInsets.only(left: 20,right: 20.0),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(24),
                  ),
                child: EditTextField(
                  "",
                  viewModel.search,
                  placeholder: "Search Task",
                  showBorder: false,
                  prefixIcon: const Padding(
                    padding:  EdgeInsets.only(right: 5.0,left: 5.0,top: 2.0),
                    child: Icon(Icons.search,color: AppColor.text,),
                  ),
                  onChanged: (value) {
                    viewModel.notifyListeners();
                  },
                  onSubmitted: (val) {

                  },
                ),
              ),


            VerticalSpacing.d10px(),


              if(viewModel.taskList?.isEmpty == true)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top:30.0),
                    child: Text('No task found' , style: AppTextStyle.title3Medium,),
                  ),
                )

                else if(viewModel.taskList?.isEmpty == true && viewModel.search.text.isNotEmpty)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top:30.0),
                    child: Column(
                      children: [
                        Text('No results found for "${viewModel.search.text}"' , style: AppTextStyle.title3Medium,),
                        TextButton(onPressed: (){
                         viewModel.clearSearchText();
                        }, child: Text("Clear", style: AppTextStyle.title3Medium.copyWith(decoration: TextDecoration.underline,color: AppColor.primary),))
                      ],
                    ),
                  ),
                )

            else

            //item list
            ...List.generate(viewModel.taskList?.length ?? 0, (index) {
                final task = viewModel.taskList![index];
                return Dismissible(
                    key: Key(task.id),
                    onDismissed: (_) async {
                       viewModel.onDismissed(task,context);
                    },
                    confirmDismiss: (_) async {
                      AlertResponse? alertResponse = await locator<DialogService>().showConfirmationAlertDialog(title: "Delete Task",
                          subtitle: 'Are you sure you want to delete this task?',secondaryButton: "CANCEL");
                      return alertResponse?.status ?? false;
                    },
                    child: InkWell(
                      onTap: (){
                        navigationService.pushNamed(Routes.createTask, arguments: task)!.then((val) async {
                          await viewModel.init();
                        });
                      },
                        child: _TaskItem(title: task.title, status: task.status,description: task.description ?? '',)));
              }),

            ],
          ),
        ),
      );
  }
}


class _TaskItem extends StatelessWidget {
  final String title;
  final String status;
  final String? description;

  const _TaskItem({
    Key? key,
    required this.title,
    required this.status,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isCompleted = status.toLowerCase() == "completed";

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyle.body1Bold
                  ),
                ),

                _StatusChip(isCompleted: isCompleted),
              ],
            ),

            if (description != null && description!.isNotEmpty) ...[
            VerticalSpacing.custom(value: 8),

              Text(
                description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.body,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final bool isCompleted;

  const _StatusChip({required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isCompleted ? AppColor.primary : AppColor.orange,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isCompleted ? "Completed" : "Pending",
        style: AppTextStyle.label1Regular.copyWith(fontSize: 12,fontWeight: FontWeight.w500,color: AppColor.white)
        ),
      );
  }
}


