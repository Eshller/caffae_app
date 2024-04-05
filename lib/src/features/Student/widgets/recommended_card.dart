import 'package:caffae_app/src/Global/Export/export.dart';

class RecommendedCard extends StatelessWidget {
  final GuruModel? jack;
  const RecommendedCard({super.key, required this.jack});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      borderOnForeground: false,
      margin: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        //set border radius more than 50% of height and width to make circle
      ),
      child: Container(
        // height: 145,

        decoration: BoxDecoration(
          color: kBackGroundColors,
          borderRadius: BorderRadius.circular(15),
        ),
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 37,
              foregroundImage: NetworkImage(jack!.imageUrl.toString()),
              foregroundColor: Colors.green,
            ),
            const SizedBox(
              height: 5,
            ),
            Flexible(
              child: SizedBox(
                height: 14,
                child: ReusableText(
                  text: jack!.username.toString(),
                  textStyle: appStyle(
                    fw: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            ReusableText(
              text: jack!.specialist.toString(),
              textStyle: appStyle(
                fw: FontWeight.w500,
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            ReusableText(
              text: 'May 23,2023',
              textStyle: appStyle(
                fw: FontWeight.w400,
                fontSize: 10,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
