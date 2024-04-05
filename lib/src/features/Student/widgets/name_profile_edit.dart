import 'package:caffae_app/src/Global/Export/export.dart';

class CommonNameProfileWidget extends StatelessWidget {
  final TextEditingController nameController;
  final String displayName;
  final VoidCallback onTapCancel;
  final VoidCallback onTapOk;

  const CommonNameProfileWidget({
    super.key,
    required this.nameController,
    required this.displayName,
    required this.onTapCancel,
    required this.onTapOk,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ReusableText(
          text: displayName,
          textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: const Color(0xFF283246)),
        ),
        const SizedBox(
          width: 5,
        ),
        InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        7,
                      ),
                    ),
                    title: const Text(
                      "Enter your name",
                    ),
                    content: TextFormField(
                      controller: nameController,
                    ),
                    actions: [
                      InkWell(
                        onTap: onTapCancel,
                        //  () {

                        // },
                        child: GlobalContainer(
                          height: 35,
                          width: 90,
                          borderWidth: 1.1,
                          borderRadius: BorderRadius.circular(12),
                          color: kBackGroundColors,
                          child: ReusableText(
                            text: 'cancel',
                            textStyle: appStyle(
                              fw: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: onTapOk,
                        child: GlobalContainer(
                          height: 35,
                          width: 90,
                          borderWidth: 1.1,
                          borderRadius: BorderRadius.circular(12),
                          color: kBackGroundColors,
                          child: ReusableText(
                              text: 'Ok',
                              textStyle: appStyle(
                                  fw: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white)),
                        ),
                      )
                    ],
                  );
                },
              );
            },
            child: const Icon(Icons.mode_edit_outlined))
      ],
    );
  }
}
