import 'package:doa2k/feature/home_screen/domain/entity/drug_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DrugTypeAdaptor extends TypeAdapter<Drug> {
  @override
  Drug read(BinaryReader reader) {
    // TODO: implement read
    return Drug(
      drugName: reader.readString(),
      notes: reader.readString(),
      timeCol: reader.readString(),
      numberOfDays: reader.readInt(),
      dateTime: reader.readInt(),
      hour: reader.readInt(),
      minutes: reader.readInt(),
    );
  }

  @override
  // TODO: implement typeId
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Drug obj) {
    writer.writeString(obj.drugName);
    writer.writeString(obj.notes);
    writer.writeString(obj.timeCol);
    writer.writeInt(obj.numberOfDays);
    writer.writeInt(obj.dateTime);
    writer.writeInt(obj.hour);
    writer.writeInt(obj.minutes);
    writer.writeInt(obj.id);
  }
}
