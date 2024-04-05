import 'package:caffae_app/models/ModelProvider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
// Import the UserModel class

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    // Implement reading a UserModel from binary
    // Example implementation - update this based on your UserModel structure
    return UserModel(
      id: reader.readString(),
      username: reader.readString(),
      phoneNumber: reader.readString(),
      createdAt: reader.readString(),
      isVerified: reader.readBool(),
      isGuru: reader.readBool(),
      listExplore:
          reader.readList().cast<String>(), // Modify based on list type
      photoUrl: reader.readString(),
      role: reader.readString(),
      documentId: reader.readString(),
      pushToken: reader.readString(),
      // Modify based on DateTime type
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    // Implement writing UserModel to binary
    // Example implementation - update this based on your UserModel structure
    writer.writeString(obj.id);
    writer.writeString(obj.username ?? ''); // Replace with your field accessors
    writer.writeString(
        obj.phoneNumber ?? ''); // Replace with your field accessors
    writer
        .writeString(obj.createdAt ?? ''); // Replace with your field accessors
    writer.writeBool(
        obj.isVerified ?? false); // Replace with your field accessors
    writer.writeBool(obj.isGuru ?? false); // Replace with your field accessors
    writer
        .writeList(obj.listExplore ?? []); // Replace with your field accessors
    writer.writeString(obj.photoUrl ?? ''); // Replace with your field accessors
    writer.writeString(obj.role ?? ''); // Replace with your field accessors
    writer
        .writeString(obj.documentId ?? ''); // Replace with your field accessors
    writer
        .writeString(obj.pushToken ?? ''); // Replace with your field accessors
    // Replace with your field accessors
  }
}
