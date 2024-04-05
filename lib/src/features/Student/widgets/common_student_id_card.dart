import 'package:caffae_app/src/Global/Export/export.dart';

class CommonStudentDocumentCard extends StatelessWidget {
  final bool isYesChecked;
  final bool isNoChecked;
  final void Function(bool?)? noOnCheckedCall;
  final void Function(bool?)? yesOnCheckedCall;
  final void Function()? uploadDocumentId;
  const CommonStudentDocumentCard({
    super.key,
    required this.isYesChecked,
    required this.isNoChecked,
    required this.noOnCheckedCall,
    required this.yesOnCheckedCall,
    required this.uploadDocumentId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableText(
            text: 'Get 10 coins on uploading your studentId?',
            textStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: const Color(0xFF2067FD),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          ReusableText(
            text: 'Are you below or in 10th grade ?',
            textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: const Color(0xFF283246),
            ),
          ),
          Row(
            children: [
              Row(
                children: [
                  Checkbox(
                      value: isYesChecked,
                      shape: const CircleBorder(),
                      onChanged: yesOnCheckedCall
                      // (value) {

                      // },
                      ),
                  Text(
                    'Yes',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: const Color(0xFF283246),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: isNoChecked,
                      shape: const CircleBorder(),
                      onChanged: noOnCheckedCall
                      //  (value) {

                      ),
                  Text(
                    'No',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: const Color(0xFF283246),
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (isYesChecked)
            InkWell(
              onTap: uploadDocumentId,
              child: GlobalContainer(
                height: 35,
                borderWidth: 1.1,
                borderRadius: BorderRadius.circular(13),
                width: MediaQuery.of(context).size.width / 1.6,
                color: kBackGroundColors,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        text: 'Upload Student id',
                        textStyle: appStyle(
                          fw: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      const Icon(
                        Icons.upload,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          if (isNoChecked)
            GlobalContainer(
              height: 38,
              borderWidth: 0.0,
              borderRadius: BorderRadius.circular(13),
              width: MediaQuery.of(context).size.width / 1.6,
              color: HexColor('#CDCDCD'),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                      text: 'Upload Student id',
                      textStyle: appStyle(
                        fw: FontWeight.w300,
                        fontSize: 16,
                        color: const Color(0xFFA3A7AE),
                      ),
                    ),
                    const Icon(
                      Icons.upload,
                      color: Color(0xFFA3A7AE),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
