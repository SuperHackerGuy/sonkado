import 'package:flutter/material.dart';
import 'package:sonkado/person_model.dart';

class PersonForm extends StatefulWidget {
  late List<Person> people;
  late Function onPressedAddPerson;

  PersonForm(
      {super.key, required this.people, required this.onPressedAddPerson}) {
    people = people;
    onPressedAddPerson = onPressedAddPerson;
  }

  @override
  State<PersonForm> createState() => _PersonFormState();
}

class _PersonFormState extends State<PersonForm> {
  final nameController = TextEditingController();
  final presentController = TextEditingController();
  final dtController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    presentController.dispose();
    dtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: "Name",
            ),
          ),
          TextFormField(
            controller: presentController,
            decoration: const InputDecoration(
              labelText: "Present",
            ),
          ),
          TextFormField(
            controller: dtController,
            decoration: const InputDecoration(
              labelText: "Birthday",
            ),
          ),
          ElevatedButton(
            onPressed: () => widget.onPressedAddPerson(
              nameController.text,
              presentController.text,
              DateTime.parse(dtController.text),
            ),
            child: const Text("Add person"),
          ),
        ],
      ),
    );
  }
}
