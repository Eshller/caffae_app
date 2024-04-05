// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:caffae_app/src/Global/Export/export.dart';

class CommonCard extends StatelessWidget {
  final Widget child;
  final double? height;
  const CommonCard({
    super.key,
    required this.child,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: GlobalContainer(
        height: height,
        borderWidth: 0.0,
        width: MediaQuery.of(context).size.width,
        borderRadius: BorderRadius.circular(10),
        color: whiteColor,
        child: child,
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final double minHeight;
  final double minWidth;
  final Widget child;
  const CustomContainer({
    super.key,
    required this.minHeight,
    required this.minWidth,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: minWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          constraints: BoxConstraints(
            minHeight: minHeight,
          ),
          child: child,
        ));
  }
}
