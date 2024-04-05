import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:caffae_app/src/Global/providers/user_provider.dart';
import 'package:caffae_app/src/features/Student/meetings/controller/meeting_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class MeetingBottomSheet extends ConsumerStatefulWidget {
  final GuruModel guruModel;
  const MeetingBottomSheet({
    super.key,
    required this.guruModel,
  });

  @override
  ConsumerState<MeetingBottomSheet> createState() => _MeetingBottomSheetState();
}

class _MeetingBottomSheetState extends ConsumerState<MeetingBottomSheet> {
  final List<String> list1 = [
    '6:00 AM',
    '7:00 AM',
    '8:00 AM',
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 AM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
    '6:00 AM',
    '7:00 PM',
    '8:00 PM',
    '9:00 PM',
    '10:00 PM',
    '11:00 PM',
    '12:00 PM',
    '1:00 AM',
    '2:00 AM',
    '3:00 AM',
    '4:00 AM',
  ];

  final List<String> list2 = ['9:00 AM', '10:00 PM', '6:00 PM', '3:00 PM'];

  String? selectedValue;
  bool isVoiceCall = false;
  bool isVideoCall = false;

  String _setDate = '';
  DateTime selectedDate = DateTime.now();

  final TextEditingController _dateController = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        helpText: 'DD/MM/YYYY',
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final user = ref.watch(userProvider).user;
    final addMeetings = ref.watch(meetingListControllerProvider.notifier);
    print("photourl${user.photoUrl}");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 8),
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: ReusableText(
                  text: '❌',
                  textStyle: appStyle(
                      fw: FontWeight.bold, fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ReusableText(
            text: 'Date',
            textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              _selectDate(context);
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: 36,
              padding: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(12)),
              child: TextFormField(
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
                enabled: false,
                keyboardType: TextInputType.text,
                controller: _dateController,
                onSaved: (val) {
                  _setDate = val!;
                },
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      icon: const Icon(Icons.calendar_month),
                    ),
                    disabledBorder:
                        const UnderlineInputBorder(borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.only(top: 0.0)),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          ReusableText(
            text: 'Time',
            textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          GlobalContainer(
            height: 38,
            borderWidth: 1.1,
            width: 120,
            borderRadius: BorderRadius.circular(10),
            color: HexColor('#D9D9D9'),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<String>(
                    iconSize: 30,
                    elevation: 20,
                    // isExpanded: true,
                    padding: const EdgeInsets.only(right: 3),
                    value: selectedValue,
                    hint: Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: ReusableText(
                        text: '23:00',
                        textStyle: appStyle(
                          fw: FontWeight.w400,
                          fontSize: 16.5,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    onChanged: (newValue) {
                      // Check if the selected item is in list2
                      final bool isInList2 = list2.contains(newValue);

                      if (isInList2) {
                        // If the selected item is in list2, show a message or perform other actions.
                        // For example, you can show a snackbar.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Cannot select item from list2!')),
                        );

                        // You can also set the selectedValue to null to reset the dropdown selection.
                        // This will prevent the user from selecting the disabled item.
                        setState(() {
                          selectedValue = null;
                        });
                      } else {
                        // Update the selectedValue with the new value.
                        setState(() {
                          selectedValue = newValue;
                        });
                      }
                    },
                    items: list1.map<DropdownMenuItem<String>>((String value) {
                      final bool isInList2 = list2.contains(value);
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: isInList2 ? Colors.blue : Colors.black,
                          ),
                        ),
                        onTap: () {
                          if (isInList2) {
                            // If the item is in list2, don't allow selection by returning null.
                            return;
                          }
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Checkbox(
                    tristate: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    value: isVideoCall,
                    onChanged: (value) {
                      setState(() {
                        isVideoCall = value!;
                        // isVideoCall = value!;
                        if (isVideoCall) {
                          isVoiceCall = false;
                          isVideoCall = true;
                        }
                      });
                    },
                  ),
                  ReusableText(
                    text: 'Audio Call',
                    textStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
                child: Row(
                  children: [
                    Checkbox(
                      tristate: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      value: isVoiceCall,
                      onChanged: (value) {
                        setState(() {
                          isVoiceCall = value!;

                          if (isVoiceCall) {
                            isVideoCall = false;
                          }
                        });
                      },
                    ),
                    ReusableText(
                      text: 'Video Call',
                      textStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      MeetingModel meetingModel = MeetingModel(
                        senderName: user.username.toString(),
                        senderPic: user.photoUrl.toString(),
                        isAccept: false,
                        isDecline: false,
                        isDonePayment: false,
                        receiverName: widget.guruModel.name,
                        receiverPic: widget.guruModel.imageUrl.toString(),
                        senderId: user.id,
                        receiverId: widget.guruModel.id.toString(),
                        date: _dateController.text.trim(),
                        time: selectedValue.toString(),
                        isAudio: isVoiceCall,
                        isDone: false,
                        isVideo: isVideoCall,
                      );
                      Navigator.pop(context);
                      addMeetings.addTrip(meetingModel: meetingModel);

                      // ref.watch(meetingStateProvider)
                    },
                    child: GlobalContainer(
                      height: 40,
                      width: 125,
                      borderWidth: 1.1,
                      color: kBackGroundColors,
                      borderRadius: BorderRadius.circular(14),
                      child: ReusableText(
                        text: 'Send',
                        textStyle: appStyle(
                          fw: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showBottomSheetMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}
