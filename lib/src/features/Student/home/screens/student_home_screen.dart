import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:caffae_app/src/Global/providers/user_provider.dart';
import 'package:caffae_app/src/features/Guru/Screens/guru_profile.dart';
import 'package:caffae_app/src/features/Student/home/controller/home_controller.dart';
import 'package:caffae_app/src/features/Student/home/widgets/home_meeting_shimmer.dart';
import 'package:caffae_app/src/features/Student/home/widgets/meeting_widget.dart';
import 'package:caffae_app/src/features/Student/home/widgets/recently_contact_card.dart';
import 'package:caffae_app/src/features/Student/meetings/controller/meeting_controller.dart';
import 'package:caffae_app/src/features/Student/widgets/meeting_container.dart';

class StudentHomePage extends ConsumerStatefulWidget {
  static const String routeName = 'home-page';
  final String? userid;

  const StudentHomePage({
    super.key,
    this.userid,
  });

  @override
  ConsumerState<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends ConsumerState<StudentHomePage> {
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(userProvider).user;

    final AsyncValue<List<MeetingModel>> meetings =
        ref.watch(meetingListControllerProvider);

    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 9, left: 9, bottom: 65),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderHome(),
            HomeNameRich(
              title1: 'Hey ',
              title2: currentUser.name ?? '',
            ),
            const SizedBox(height: 14),
            GestureDetector(
              child: const HomeText(
                text: 'Schedule',
              ),
            ),
            const SizedBox(height: 14),
            Container(
              constraints: const BoxConstraints(minHeight: 316),
              child: meetings.when(
                data: (data) {
                  final filtered = data.where((meeting) {
                    // Filter conditions
                    return meeting.senderId == currentUser.id &&
                        meeting.isDonePayment == true;
                  }).toList();
                  if (filtered.isNotEmpty) {
                    return ListView.builder(
                        itemCount: filtered.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final meeting = filtered[index];

                          return MeetingContainer(
                            context: context,
                            meetingModel: meeting,
                          );
                        });
                  }
                  return const MeetingWidget();
                  // return const HomeMeetingShimmer();
                },
                loading: () => const HomeMeetingShimmer(),
                error: (err, stack) => Text('Error: $err'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            const HomeText(
              text: 'Recently Contacted',
            ),
            const SizedBox(height: 10),
            const HomeText(text: "Recommended For You"),
            const SizedBox(height: 10),
            SizedBox(
              height: 165,
              child: ref.watch(fetchByInterset).when(
                    data: (data) {
                      final filtered = data.where((guru) {
                        // Filter conditions
                        return guru.id != currentUser.id;
                      }).toList();
                      if (filtered.isNotEmpty) {
                        return ListView.builder(
                          itemCount: filtered.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            GuruModel guruModel = filtered[index];

                            // return const HorizontalRecommendedShimmer();
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
                                    RecentlyContactCard(userData: guruModel));
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
                        itemCount: 5,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const HorizontalRecommendedShimmer();
                        }),
                    error: ((error, stackTrace) {
                      return Text('error: $error');
                    }),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
