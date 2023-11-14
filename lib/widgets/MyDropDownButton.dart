/* import 'package:flutter/material.dart';

/* List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Malo"), value: "Malo"),
    DropdownMenuItem(child: Text("Regular"), value: "Regular"),
    DropdownMenuItem(child: Text("Bueno"), value: "Bueno"),
  ];
  return menuItems;
} */

/* List<DropdownMenuItem<String>> get dropdownradio {
  List<DropdownMenuItem<String>> radioItems = const [
    DropdownMenuItem(child: Text("Malo"), value: "Malo"),
    DropdownMenuItem(child: Text("Regular"), value: "Regular"),
    DropdownMenuItem(child: Text("Bueno"), value: "Bueno"),
  ];
  return radioItems;
} */

class MyDropDowButton extends StatefulWidget {
  const MyDropDowButton({super.key});

  @override
  State<MyDropDowButton> createState() => _MyDropDowButtonState();
}

class _MyDropDowButtonState extends State<MyDropDowButton> {
  String selectedValue = "Malo";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      elevation: 0,
      // dropdownColor: Colors.grey[200],
      items: dropdownItems,
      value: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value.toString();
        });
      },
      hint: const Text("Select item"),
    );
  }
}
 */