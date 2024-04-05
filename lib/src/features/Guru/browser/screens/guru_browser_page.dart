// ignore_for_file: depend_on_referenced_packages

import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:caffae_app/src/Global/providers/user_provider.dart';
import 'package:caffae_app/src/Global/themes/custom_text_style.dart';
import 'package:caffae_app/src/Global/widgets/custom_image_view.dart';
import 'package:caffae_app/src/features/Guru/search/search_card.dart';
import 'package:caffae_app/src/features/Guru/search/widgets/shimmer_item.dart';
import 'package:caffae_app/src/features/Student/home/controller/home_controller.dart';

class GuruBrowserPage extends ConsumerStatefulWidget {
  final GuruModel guruModel;
  const GuruBrowserPage({super.key, required this.guruModel});

  @override
  ConsumerState<GuruBrowserPage> createState() => _GuruBrowserPageState();
}

class _GuruBrowserPageState extends ConsumerState<GuruBrowserPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(userProvider).user;
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 14,
            ),
            SearchHeader(
              searchController: searchController,
              onChanged: (value) {
                setState(() {});
              },
            ),
            const SizedBox(
              height: 22,
            ),
            ReusableText(
              text: 'Message your peer gurus for free!',
              textStyle: appStyle(
                fontSize: 14.h,
                fw: FontWeight.w400,
                color: customBlueColor,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              thickness: 1,
              color: blackColor,
            ),
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 17.h),
                    child: Row(children: [
                      Text('sort', style: CustomTextStyles.bodySmall12),
                      CustomImageView(
                          imagePath: 'assets/images/img_share.svg',
                          height: 6.v,
                          width: 9.h,
                          margin: EdgeInsets.only(
                              left: 2.h, top: 6.v, bottom: 5.v)),
                      Padding(
                          padding: EdgeInsets.only(left: 14.h),
                          child: Text('filter',
                              style: CustomTextStyles.bodySmall12)),
                      CustomImageView(
                          imagePath: 'assets/images/img_mi_filter.svg',
                          height: 11.adaptSize,
                          width: 11.adaptSize,
                          margin: EdgeInsets.only(top: 4.v, bottom: 2.v))
                    ])),
                SizedBox(height: 12.v),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ref
                .watch(
                    fetchBasedOnInterestProvider(widget.guruModel.specialist!))
                .when(
                  data: (data) {
                    // print(data);
                    final filtered = data.where((guru) {
                      return guru.id != currentUser.id;
                    }).toList();
                    if (filtered.isNotEmpty) {
                      return ListView.builder(
                        itemCount: filtered.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          GuruModel guruModel = filtered[index];
                          final name = guruModel.name;
                          if (searchController.text.isEmpty) {
                            return SearchCardGuru(
                              userData: guruModel,
                            );
                          } else if (name!.toLowerCase().contains(
                              searchController.text.toLowerCase().toString())) {
                            return SearchCardGuru(
                              userData: guruModel,
                            );
                          }
                          return Container();
                        },
                      );
                    }

                    return Center(
                      child: ReusableText(
                        text: 'There is no recommandation availble',
                        textStyle: appStyle(
                          fw: FontWeight.w300,
                          fontSize: screenWidth * 0.04,
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                  loading: () => ListView.builder(
                      itemCount: 12,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          elevation: 30,
                          child: GlobalContainer(
                            height: 115,
                            borderWidth: 1.1,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            child: const ShimmerItem(),
                          ),
                        );
                      }),
                  error: ((error, stackTrace) {
                    return Text('error: $error');
                  }),
                ),
          ],
        ),
      ),
    );
  }
}
