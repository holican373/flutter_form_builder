import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class StudentEntry extends StatefulWidget {
  @override
  _StudentEntryState createState() => _StudentEntryState();
}

class _StudentEntryState extends State<StudentEntry> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Form Validation"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FormBuilder(
                key: _fbKey,
                initialValue: {
                  'date': DateTime.now(),
                  'accept_terms': false,
                },
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      attribute: 'text',
                      validators: [FormBuilderValidators.required()],
                      decoration: InputDecoration(labelText: "Name"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    FormBuilderTextField(
                      attribute: 'text',

                      validators: [FormBuilderValidators.required()],
                      decoration: InputDecoration(labelText: "Address"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    FormBuilderTextField(
                      attribute: "age",
                      decoration: InputDecoration(labelText: "Phone Number"),
                      keyboardType: TextInputType.number,
                      validators: [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.max(70),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    FormBuilderDateTimePicker(
                      attribute: "date",
                      inputType: InputType.date,
                      validators: [FormBuilderValidators.required()],
                      format: DateFormat("dd-MM-yyyy"),
                      decoration: InputDecoration(labelText: "Date of Birth"),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      )
    );
  }
}