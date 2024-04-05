import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:file_picker/file_picker.dart';

Future<FilePickerResult?> pickImageFromGallery(BuildContext context) async {
  FilePickerResult? result;
  try {
    final res = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
      withReadStream: true,
      withData: false,
    );
    if (res != null) {
      result = res;
    }
  } catch (e) {
    if (context.mounted) {
      snackbar(context: context, content: e.toString());
    }
  }
  return result;
}
