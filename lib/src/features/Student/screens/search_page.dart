/*
// ignore_for_file: depend_on_referenced_packages



import 'package:caffae_app/src/Global/Export/export.dart';

enum SortOption {
  rating,
  experience,
  voiceCharge,
  videoCharge,
}

SortOption selectedSortOption = SortOption.rating;

class ItemModel {
  String title;
  IconData icon;

  ItemModel(this.title, this.icon);
}

class SearchPage extends ConsumerStatefulWidget {
  static const String routeName = 'search-page';
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }


  int? selectedIndex;
  bool gridViewVisible = true;

  int selectedPerIndex = -1;

//
  Icon getMenuIcon() {
    switch (selectedSortOption) {
      case SortOption.rating:
        return const Icon(Icons.arrow_upward, color: Colors.black);
      case SortOption.experience:
        return const Icon(Icons.arrow_upward, color: Colors.black);
      case SortOption.voiceCharge:
        return const Icon(Icons.collections, color: Colors.black);
      case SortOption.videoCharge:
        return const Icon(Icons.arrow_downward, color: Colors.black);
    }
  }

  List<ItemModel> menuItems = [
    ItemModel('rating', Icons.arrow_upward),
    ItemModel('experience', Icons.arrow_upward),
    ItemModel('voice charge', Icons.collections),
    ItemModel('video charge', Icons.arrow_downward),
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        children: [
          // Center(
          //     child: Image.asset(
          //   'assets/images/logo.png',
          //   filterQuality: FilterQuality.low,
          //   opacity: const AlwaysStoppedAnimation(.37),
          //   height: 320,
          //   width: 320,
          //   fit: BoxFit.cover,
          // )),
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
            height: 20,
          ),
          if (selectedIndex == null)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 10,
                    crossAxisCount: 3,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: 11,
                  itemBuilder: (context, index) {

                    return GestureDetector(
                      onTap: () {

                      },
                      child: GlobalContainer(
                        borderWidth: 1.1,
                        height: 47,
                        width: MediaQuery.of(context).size.width / 3,
                        color: kBackGroundColors,
                        borderRadius: BorderRadius.circular(18),
                        child: ReusableText(
                          text: '',
                          textStyle: appStyle(
                            fw: customFont500Weight,
                            fontSize: 10,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          if (selectedIndex != null)
            SelectedChip(
              text: per[selectedIndex!].name,
              onDeleted: () {
                setState(() {
                  selectedIndex = null;
                  gridViewVisible = true;
                });
              },
            ),

          if (!gridViewVisible)
            const SizedBox(
              height: 22,
              child: Divider(
                thickness: 1.2,
                color: blackColor,
              ),
            ),
          if (!gridViewVisible)
            PopMenuHolder(
              controller: _controller,
              children: menuItems
                  .map(
                    (item) => GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () async {
                        switch (item.title) {
                          case 'rating':
                            selectedSortOption = SortOption.rating;
                            break;
                          case 'experience':
                            selectedSortOption = SortOption.experience;
                            break;
                          case 'voice charge':
                            selectedSortOption = SortOption.voiceCharge;
                            break;
                          case 'video charge':
                            selectedSortOption = SortOption.videoCharge;
                            break;
                        }
                        if (selectedSortOption == SortOption.rating) {
                          await fetchGuruByIncreasingOrder(star: false)
                              .then((value) {
                            setState(() {
                              gurus = value;
                            });
                            _controller.hideMenu();
                          });
                        } else if (selectedSortOption ==
                            SortOption.experience) {
                          await basedOnYearOfExperience(
                                  yearOfExperience: false,
                                  specialist: per[selectedPerIndex].name)
                              .then((value) {
                            setState(() {
                              gurus = value;
                            });
                            _controller.hideMenu();
                          });
                        } else if (selectedSortOption ==
                            SortOption.voiceCharge) {
                        } else if (selectedSortOption ==
                            SortOption.videoCharge) {}
                      },
                      child: Container(
                        height: 40,
                        width: 129,
                        padding: const EdgeInsets.only(left: 7),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              item.icon,
                              size: 15,
                              color: whiteColor,
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 10),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                child: Text(
                                  item.title,
                                  style: appStyle(
                                    fw: customFont500Weight,
                                    fontSize: 11,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),


          if (!gridViewVisible)
            const SizedBox(
              height: 10,
            ),
          if (!gridViewVisible)
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(right: 6, left: 6, bottom: 62),
                  child: Column(
                    children: [
                      ListView.builder(
                              itemCount: 3,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                final userData = gurus![index];
                                final name = userData.username;

                                if (searchController.text.isEmpty) {
                                  return SearchCard(
                                    userData: userData,
                                  );
                                } else if (name!.toLowerCase().contains(
                                      searchController.text
                                          .toLowerCase()
                                          .toString(),
                                    )) {
                                  return SearchCard(
                                    userData: userData,
                                  );
                                }
                                return Container();
                              }),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
*/
