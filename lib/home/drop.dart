/* import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
//import http package manually


class EditAddressFormPage extends StatefulWidget {
  const EditAddressFormPage({Key? key}) : super(key: key);
  @override
  EditPhoneFormPageState createState() {
    return EditPhoneFormPageState();
  }
}

class EditPhoneFormPageState extends State<EditAddressFormPage> {
  final _formKey = GlobalKey<FormState>();
  final addressCountryController = TextEditingController();
  final addressCityController = TextEditingController();
  var user = UserData.myUser;

  String? selectedValue;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  @override
  void dispose() {
    addressCountryController.dispose();
    addressCityController.dispose();
    super.dispose();
  }

  void updateCountry(String country) {
    String formattedPhoneNumber = country.substring(0,country.length);
    user.address_country = formattedPhoneNumber;
  }

  void updateCity(String city) {
    String formattedPhoneNumber = city.substring(0, city.length);
    user.address_city = formattedPhoneNumber;
  }

  _goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
              children: <Widget>[
                const SizedBox(height: 15),
                const Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        width: 270,
                        child: Text("What is your new address?",
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ))),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Text('Select country', style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).hintColor,),),
                        items: items.map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(fontSize: 14,),),)).toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;});},
                        buttonHeight: 40,
                        buttonWidth: 320,
                        itemHeight: 40,
                      ),
                    ),),

                Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: SizedBox(
                        height: 100,
                        width: 320,
                        child: TextFormField(
                          // Handles Form Validation
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your city';
                            }
                            return null;
                          },
                          controller: addressCityController,
                          decoration: const InputDecoration(
                            labelText: 'City',
                          ),
                        ))),
                Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 320,
                          height: 50,
                          child: ElevatedButton(

                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate() ) {
                                updateCountry(addressCountryController.text);
                                updateCity(addressCityController.text);
                                Navigator.pop(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black),
                            child: const Text(
                              'Update',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        )))
              ]),
        ));
  }
} */