import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerItem extends StatelessWidget {
  const ShimmerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      // baseColor: Colors.grey.shade200,
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(children: [
          Container(
            height: 85,
            width: 84,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 75,
                  height: 15,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Container(
                  width: double.infinity,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  height: 15,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
