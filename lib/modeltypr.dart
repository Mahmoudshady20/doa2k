import 'package:doa2k/model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ModelTypeAdaptor extends TypeAdapter<Model>{
  @override
  Model read(BinaryReader reader) {
    // TODO: implement read
    return Model(name: reader.readString(), job: reader.readString(), age: reader.readInt());
  }

  @override
  // TODO: implement typeId
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Model obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.job);
    writer.writeInt(obj.age);
  }

}