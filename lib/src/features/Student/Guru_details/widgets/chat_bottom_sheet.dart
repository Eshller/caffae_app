import 'package:caffae_app/src/Global/Export/export.dart';

class ChatBottomSheet extends StatelessWidget {
  const ChatBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: ReusableText(
                text: '❌',
                textStyle: appStyle(
                    fw: FontWeight.bold, fontSize: 16, color: Colors.black),
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: ReusableText(
                text: 'Coming soon',
                textStyle: appStyle(
                    fw: FontWeight.bold, fontSize: 16, color: Colors.black)),
          ),
        ),
      ],
    );
  }
}
