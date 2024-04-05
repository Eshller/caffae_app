import 'package:caffae_app/models/ModelProvider.dart';
import 'package:caffae_app/src/Global/Utils/size_utils.dart';
import 'package:caffae_app/src/Global/themes/app_decoration.dart';
import 'package:caffae_app/src/Global/themes/custom_text_style.dart';
import 'package:caffae_app/src/Global/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';

class Userprofilelist1ItemWidget extends StatelessWidget {
  const Userprofilelist1ItemWidget({
    super.key,
    required this.userprofilelist1ItemModelObj,
    required this.averageRating,
  });

  final ReviewsModel userprofilelist1ItemModelObj;
  final double averageRating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.h,
        vertical: 7.v,
      ),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      width: 207.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            userprofilelist1ItemModelObj.senderName!,
            style: CustomTextStyles.labelMediumPrimary,
          ),
          SizedBox(height: 2.v),
          CustomRatingBar(
            ignoreGestures: true,
            initialRating: averageRating,
          ),
          SizedBox(height: 4.v),
          SizedBox(
            width: 177.h,
            child: Text(
              userprofilelist1ItemModelObj.message!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.bodySmall8,
            ),
          ),
          SizedBox(height: 4.v),
        ],
      ),
    );
  }
}
