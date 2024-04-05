import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:flutter_svg/svg.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader(
      {super.key, required this.searchController, required this.onChanged});

  final TextEditingController searchController;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 45.h,
            width: 45.v,
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 9),
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: onChanged,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            constraints: const BoxConstraints(minWidth: 44),
            height: 30,
            decoration: BoxDecoration(
                color: kBackGroundColors, borderRadius: globalBorderRadius),
            padding: const EdgeInsets.all(6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/svg/game-icons_two-coins.svg'),
                ReusableText(
                  text: '10',
                  textStyle: appStyle(
                    fw: customFont500Weight,
                    fontSize: 13,
                    color: whiteColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
