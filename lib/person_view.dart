import 'package:flutter/material.dart';
import 'package:sonkado/person_model.dart';

class PersonView extends StatelessWidget {
  final List<Person> persons;
  final Function onPressedRemovePerson;

  const PersonView(
      {super.key, required this.persons, required this.onPressedRemovePerson});

  @override
  Widget build(BuildContext context) {
    persons.sort((a, b) => a.getDaysLeft().compareTo(b.getDaysLeft()));
    return Flexible(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: persons.length,
          itemBuilder: (context, index) {
            Person person = persons[index];
            int ageToBe = person.getAgeToBe();
            DateTime birthdayThisYear = person.getBirthdayThisYear();
            int daysLeft = -1;
            if (DateTime.now().isAfter(birthdayThisYear)) {
              daysLeft = birthdayThisYear
                  .add(Duration(days: 365))
                  .difference(DateTime.now())
                  .inDays;
            } else {
              daysLeft = birthdayThisYear.difference(DateTime.now()).inDays;
            }

            return ListTile(
              textColor: daysLeft < 14
                  ? Colors.red
                  : (person.present != "" ? Colors.black : Colors.orange),
              subtitle: (person.present != "")
                  ? Text(person.present!)
                  : const Text("NOCH KEIN GESCHENK!!111"),
              title: Text(
                "${person.name} wird $ageToBe in $daysLeft Tagen",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle),
                onPressed: () => onPressedRemovePerson(index),
              ),
            );
          }),
    );
  }
}
