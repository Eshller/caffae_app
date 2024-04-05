// ignore_for_file: depend_on_referenced_packages, deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:caffae_app/src/Global/providers/user_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GuruHomeScreen extends ConsumerStatefulWidget {
  final GuruModel guruModel;
  const GuruHomeScreen({super.key, required this.guruModel});

  @override
  ConsumerState<GuruHomeScreen> createState() => _GuruHomeScreenState();
}

class _GuruHomeScreenState extends ConsumerState<GuruHomeScreen> {
  DateTime? lastBackPress;
  Future<bool> onWillPop() async {
    if (index != 0) {
      setState(() {
        index = 0; // Navigate back to home screen
      });
      return false;
    }

    // Handling the back press exit app logic
    if (lastBackPress == null ||
        DateTime.now().difference(lastBackPress!) >
            const Duration(seconds: 2)) {
      lastBackPress = DateTime.now();

      BotToast.showText(
        text: "Press back again to exit app",
      );

      return false;
    }

    return true; // Exit app
  }

  int index = 0;
  @override
  Widget build(
    BuildContext context,
  ) {
    // final guruStream = ref.watch(guruStreamProvider);
    // final userStream = ref.watch(userDataAuthProvider);
    final currentUser = ref.watch(userProvider).user;
    List<Widget> pages = [
      const StudentHomePage(),
      GuruSearchPage(),
      GuruBrowserPage(
        guruModel: widget.guruModel,
      ),
      const GuruMessagePage(),
      const GuruProfilePage(),
    ];
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: HexColor('#D9D9D9'),
        body: SafeArea(
          child: Stack(
            children: [
              pages[index],
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CommonContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              index = 0; // Switch to GuruHomePage
                            });
                          },
                          child: SvgPicture.asset(
                              'assets/svg/majesticons_home-line.svg'),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              index = 1; // Switch to GuruSearchPage
                            });
                          },
                          child:
                              SvgPicture.asset('assets/images/img_search.svg'),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              index = 2; // Switch to GuruSearchPage
                            });
                          },
                          child: SvgPicture.asset(
                              'assets/images/img_zondicons_network.svg'),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              index = 3; // Switch to GuruBrowserPage
                            });
                          },
                          child: SvgPicture.asset('assets/svg/message.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                index = 4; // Switch to GuruMessagePage
                              });
                            },
                            child: CachedNetworkImage(
                                imageUrl: currentUser.photoUrl == null
                                    ? image
                                    : currentUser.photoUrl.toString(),
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                placeholder: (context, url) => Center(
                                        child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle),
                                      child: const CircularProgressIndicator(),
                                    )),
                                errorWidget: (context, url, error) =>
                                    CircleAvatar(
                                      maxRadius: 18,
                                      backgroundImage: NetworkImage(image),
                                    )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StudentHome extends ConsumerStatefulWidget {
  final String userId;
  const StudentHome({super.key, required this.userId});

  @override
  ConsumerState<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends ConsumerState<StudentHome> {
  int index = 0;

  DateTime? lastBackPress;
  Future<bool> onWillPop() async {
    if (index != 0) {
      setState(() {
        index = 0; // Navigate back to home screen
      });
      return false;
    }

    // Handling the back press exit app logic
    if (lastBackPress == null ||
        DateTime.now().difference(lastBackPress!) >
            const Duration(seconds: 3)) {
      lastBackPress = DateTime.now();

      BotToast.showText(
        text: "Press back again to exit app",
      );

      return false;
    }

    return true; // Exit app
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(userProvider).user;
    // final isGuruProvider = ref.watch(userFromHiveProvider);
    // final userData = isGuruProvider.user;
    // print(widget.userId);

    List pages = [
      StudentHomePage(
        userid: widget.userId,
      ),
      GuruSearchPage(
        index: index,
      ),
      const ContactPage(),
      StudentProfilePage(
        userID: widget.userId,
      ),
    ];
    // final userStream = ref.watch(userDataSteamProvider);
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: HexColor('#D9D9D9'),
        body: SafeArea(
          child: Stack(
            children: [
              pages[index],
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CommonContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                index = 0; // Switch to GuruHomePage
                              });
                            },
                            child: SvgPicture.asset(
                              'assets/svg/majesticons_home-line.svg',
                            )),
                        InkWell(
                          onTap: () {
                            setState(() {
                              index = 1; // Switch to GuruSearchPage
                            });
                          },
                          child:
                              SvgPicture.asset('assets/images/img_search.svg'),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              index = 2; // Switch to GuruBrowserPage
                            });
                          },
                          child: SvgPicture.asset('assets/svg/message.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                index = 3; // Switch to GuruMessagePage
                              });
                            },
                            child: CachedNetworkImage(
                                imageUrl: currentUser.photoUrl == null
                                    ? image
                                    : currentUser.photoUrl.toString(),
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                placeholder: (context, url) => Center(
                                        child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle),
                                      child: const CircularProgressIndicator(),
                                    )),
                                errorWidget: (context, url, error) =>
                                    CircleAvatar(
                                      maxRadius: 18,
                                      backgroundImage: NetworkImage(image),
                                    )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommonContainer extends StatelessWidget {
  final Widget child;
  const CommonContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: HexColor('#2067FD'),
          boxShadow: const [
            BoxShadow(
              color: Color(0x40000000),
            ),
            BoxShadow(color: Color(0x40000000))
          ],
          borderRadius: BorderRadius.circular(15)),
      child: child,
    );
  }
}
