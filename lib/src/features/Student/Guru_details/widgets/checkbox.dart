// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';

class CheckBoxes extends StatefulWidget {
  bool isVideoCall;
  bool isVoiceCall;
  CheckBoxes({
    super.key,
    required this.isVideoCall,
    required this.isVoiceCall,
  });

  @override
  _CheckBoxesState createState() => _CheckBoxesState();
}

class _CheckBoxesState extends State<CheckBoxes> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Checkbox(
              value: widget.isVideoCall,
              onChanged: (value) {
                setState(() {
                  widget.isVideoCall = value!;
                  // isVideoCall = value!;
                  if (widget.isVideoCall) {
                    widget.isVoiceCall = false;
                  }
                });
              },
            ),
            const Text('Video Call'),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: widget.isVoiceCall,
              onChanged: (value) {
                setState(() {
                  widget.isVoiceCall = value!;

                  if (widget.isVoiceCall) {
                    widget.isVideoCall = false;
                  }
                });
              },
            ),
            const Text('Voice Call'),
          ],
        ),
      ],
    );
  }
}
