import 'package:doa2k/model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Box box = Hive.box<Model>('model');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton(onPressed: () async{
            //  box = await Hive.box('model');
            //   print('box opened');
            // }, child: Text('open box')),
            ElevatedButton(onPressed: (){
              box.put('key', Model(name: 'shady', job: 'atal', age: 22));
              print('data added');
            }, child: const Text('add')),
            ElevatedButton(onPressed: (){
              box.put('key', Model(name: 'shady', job: 'flutter', age: 22));
              print('data update');
            }, child: const Text('updated')),
            ElevatedButton(onPressed: (){
              Model model = box.get('key');
              print(model.name);
              print(model.job);
              print(model.age);
            }, child: const Text('print data')),
          ],
        ),
      ),
    );
  }
}
