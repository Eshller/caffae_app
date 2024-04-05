import 'package:caffae_app/src/Global/Export/export.dart';

class BecomeGuruButton extends StatelessWidget {
  final VoidCallback navigatorOnTap;
  const BecomeGuruButton({
    super.key,
    required this.navigatorOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)),
              title: ReusableText(
                  text:
                      "If you want to become a guru then you have to fill Information! are you sure?",
                  textStyle: appStyle(
                      fw: FontWeight.w500, fontSize: 14, color: Colors.black)),
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: GlobalContainer(
                    height: 35,
                    width: 90,
                    borderWidth: 1.1,
                    borderRadius: BorderRadius.circular(14),
                    color: kBackGroundColors,
                    child: ReusableText(
                      text: 'cancel',
                      textStyle: appStyle(
                        fw: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: navigatorOnTap,
                  child: GlobalContainer(
                    borderWidth: 1.1,
                    height: 35,
                    width: 90,
                    borderRadius: BorderRadius.circular(12),
                    color: kBackGroundColors,
                    child: ReusableText(
                        text: 'Ok',
                        textStyle: appStyle(
                            fw: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white)),
                  ),
                )
              ],
            );
          },
        );
      },
      child: GlobalContainer(
        height: 33,
        width: 150,
        borderWidth: 1.1,
        color: kBackGroundColors,
        borderRadius: BorderRadius.circular(10),
        child: ReusableText(
          text: 'Become a Guru',
          textStyle: appStyle(
            fw: FontWeight.bold,
            fontSize: 13,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
