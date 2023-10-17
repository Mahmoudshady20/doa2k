import 'package:doa2k/ui/component/custom_form_field.dart';
import 'package:doa2k/ui/component/date_utils.dart';
import 'package:flutter/material.dart';


class AddTaskBottomSheet extends StatefulWidget {

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        color: Colors.white
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Text('Add new Task',style: Theme.of(context).textTheme.titleMedium,)),
            Text('Task Title',style: Theme.of(context).textTheme.titleLarge,),
            CustomFormField(label: 'Enter Title', controller: titleController,
                validator: (value){
                  if(value==null || value.trim().isEmpty){
                    return 'Please enter Task title';
                  }
                  return null;
            }),
            const SizedBox(
              height: 10,
            ),
            Text('Task Details',style: Theme.of(context).textTheme.titleLarge),
            CustomFormField(label: 'Enter Details', controller: descController,
                validator: (value){
              if(value==null || value.trim().isEmpty){
                return 'Please enter Task details';
              }
              return null;
            },
            lines: 5,
            ),
            const SizedBox(
              height: 6,
            ),
            Text('Select time',style: Theme.of(context).textTheme.titleLarge,),
            InkWell(
              onTap: (){
                showDate();
              },
                child: Center(child: Text(MyDateUtils.formatTaskDate(selectedDate),style: Theme.of(context).textTheme.titleLarge,))),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(onPressed: (){
              addTaskButton();
            }, child: const Text('add'))
          ],
        ),
      ),
    );
  }

  void showDate() async {
    var date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if(date==null){
      return;
    }
    selectedDate = date;
    setState(() {

    });
  }
  void addTaskButton() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    // var authprovider = Provider.of<AuthProvider>(context, listen: false);
    // DialogUtils.showLoadingDialog(context, 'Loading...');
    //   Task task = Task(
    //     title: titleController.text,
    //     desc: descController.text,
    //     date: MyDateUtils.dateOnly(selectedDate)
    //   );
    //   await MyDataBase.addTask(authprovider.myUser?.id ?? '', task);
    //   DialogUtils.hideDialog(context);
    //   DialogUtils.showMessage(context, 'Task Added Successfully',
    //   postActionName: 'ok',posAction: (){
    //     Navigator.pop(context);
    //       }
    //   );
    }
  }

