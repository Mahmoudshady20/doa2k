import 'package:doa2k/model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    Box<Model> box = Hive.box<Model>('model');
    int i = 23;
    List<Model> models = box.values.where((element) => element.age == i).cast<Model>().toList();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton(onPressed: () async{
            //  box = await Hive.box('model');
            //   print('box opened');
            // }, child: Text('open box')),
            ElevatedButton(
                onPressed: () async {
                  await box.add(Model(name: 'shady', job: 'flutter', age: 23));
                  setState(() {

                  });
                },
                child: const Text('add')),
            ElevatedButton(
                onPressed: () async {
                  await box.clear();
                  // box.put('key', Model(name: 'shady', job: 'flutter', age: 22));
                  // print('data update');
                },
                child: const Text('updated')),
            ElevatedButton(
                onPressed: () {
                  for (int i = 0; i < models.length; i++) {
                    if (kDebugMode) {
                      print('${i + 1} ------------------------------');
                      print(models[i].name);
                      print(models[i].job);
                      print(models[i].age);
                      print('---------------------------------');
                    }
                  }
                },
                child: const Text('print data')),
          ],
        ),
      ),
    );
  }
}
