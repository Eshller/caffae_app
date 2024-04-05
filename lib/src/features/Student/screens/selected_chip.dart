import 'package:caffae_app/src/Global/Export/export.dart';

class SelectedChip extends StatelessWidget {
  final String text;
  final void Function()? onDeleted;
  const SelectedChip({
    super.key,
    required this.text,
    this.onDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
          height: 34,
          child: Chip(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: kBackGroundColors,
            label: ReusableText(
              text: text,
              textStyle: appStyle(
                fw: customFont500Weight,
                fontSize: 11,
                color: whiteColor,
              ),
            ),
            deleteIconColor: whiteColor,
            onDeleted: onDeleted,
          ),
        ),
      ),
    );
  }
}
