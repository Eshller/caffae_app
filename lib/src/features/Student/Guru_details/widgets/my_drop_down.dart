// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:caffae_app/src/Global/Export/export.dart';

class MyDropDown extends StatefulWidget {
  final List<String> list1;
  final List<String> list2;
  String? selectedValue;

  MyDropDown({
    super.key,
    required this.list1,
    required this.list2,
    this.selectedValue,
  });

  @override
  _MyDropDownState createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  // String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      padding: const EdgeInsets.all(3),
      value: widget.selectedValue,
      hint: ReusableText(
        text: '23:00',
        textStyle: appStyle(
          fw: FontWeight.w400,
          fontSize: 15.5,
          color: Colors.black,
        ),
      ),
      onChanged: (newValue) {
        // Check if the selected item is in list2
        final bool isInList2 = widget.list2.contains(newValue);

        if (isInList2) {
          // If the selected item is in list2, show a message or perform other actions.
          // For example, you can show a snackbar.
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Cannot select item from list2!')),
          );

          // You can also set the selectedValue to null to reset the dropdown selection.
          // This will prevent the user from selecting the disabled item.
          setState(() {
            widget.selectedValue = null;
          });
        } else {
          // Update the selectedValue with the new value.
          setState(() {
            widget.selectedValue = newValue;
          });
        }
      },
      items: widget.list1.map<DropdownMenuItem<String>>((String value) {
        final bool isInList2 = widget.list2.contains(value);
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
    );
  }
}
