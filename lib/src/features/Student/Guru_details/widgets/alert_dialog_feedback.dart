// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:caffae_app/src/Global/widgets/rating.dart';
import 'package:get/get.dart';

class AlertDialogFeedBack extends StatelessWidget {
  final TextEditingController messageController;
  final VoidCallback ontTap;
  final double rating;
  const AlertDialogFeedBack({
    super.key,
    required this.messageController,
    required this.ontTap,
    required this.rating,
    required GuruModel guruModel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // <-- SEE HERE
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: SizedBox(
        height: 260,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 1),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: ReusableText(
                    text: '❌',
                    textStyle: appStyle(
                        fw: FontWeight.bold, fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: ReusableText(
                text: 'Your Feedback',
                textStyle: appStyle(
                  fw: FontWeight.bold,
                  fontSize: 19,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextFormField(
              controller: messageController,
              maxLines: 4,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFFD9D9D9),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                      style: BorderStyle.none,
                      width: 0.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: ReusableText(
                text: 'Ratings',
                textStyle: appStyle(
                  fw: FontWeight.bold,
                  fontSize: 19,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: RatingButton(
                rating: rating,
                ignoreGestures: true,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: ontTap,
                child: GlobalContainer(
                  height: 40,
                  borderWidth: 1.1,
                  width: 130,
                  borderRadius: BorderRadius.circular(13),
                  color: kBackGroundColors,
                  child: ReusableText(
                    text: 'Submit',
                    textStyle: appStyle(
                        fw: FontWeight.bold, fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
