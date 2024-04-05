import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:caffae_app/src/Global/providers/user_provider.dart';
import 'package:caffae_app/src/features/Guru/Screens/guru_profile.dart';
import 'package:caffae_app/src/features/Student/home/controller/home_controller.dart';
import 'package:caffae_app/src/features/Student/home/widgets/recently_contact_card.dart';

class GuruHomePage extends ConsumerStatefulWidget {
  static const String routeName = 'home-page';
  const GuruHomePage({super.key});

  @override
  ConsumerState<GuruHomePage> createState() => _GuruHomePageState();
}

class _GuruHomePageState extends ConsumerState<GuruHomePage> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isGuruProvider = ref.watch(userFromHiveProvider);
    final userData = isGuruProvider.user;

    var screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      // controller: _scrollController,
      child: Padding(
        padding: const EdgeInsets.only(left: 9, right: 9, bottom: 65),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderHome(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeNameRich(
                    title1: 'Hey ', title2: userData!.username!.toUpperCase()),
                const SizedBox(height: 14),
                const HomeText(
                  text: 'Schedule',
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                const HomeText(
                  text: 'Recommended for you',
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 165,
                  child: ref.watch(fetchBasedOnInterestProvider('Music')).when(
                        data: (data) {
                          if (data.isNotEmpty) {
                            ListView.builder(
                              itemCount: data.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                GuruModel guruModel = data[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => GuruProfileScreen(
                                          guruModel: guruModel,
                                        ),
                                      ),
                                    );
                                  },
                                  child:
                                      RecentlyContactCard(userData: guruModel),
                                );
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
                        error: ((error, stackTrace) {
                          return null;
                        }),
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
