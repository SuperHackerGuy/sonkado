import 'package:flutter/material.dart';
import 'package:sonkado/person_form.dart';
import 'package:sonkado/person_model.dart';
import 'package:sonkado/person_view.dart';

void main(List<String> args) {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sonkado App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Person> persons = [
    Person("Jens", "Teddy", DateTime(1988, 4, 30)),
    Person("Verena", "", DateTime(1981, 4, 12)),
    Person("Sophia", "Lolli", DateTime(1992, 2, 4)),
    Person("Hendrik", "", DateTime(1987, 2, 4)),
  ];

  void onPressedAddPerson(name, present, dt) {
    setState(() {
      persons.add(Person(name, present, dt));
    });
  }

  void onPressedRemovePerson(index) {
    setState(() {
      persons.removeAt(index);
    });
  }

  void startAddNewPerson(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: PersonForm(
              people: persons,
              onPressedAddPerson: onPressedAddPerson,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("sonkado!"),
      ),
      body: Column(
        children: <Widget>[
          PersonView(
            persons: persons,
            onPressedRemovePerson: onPressedRemovePerson,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAddNewPerson(context),
        tooltip: 'Add person',
        child: const Icon(Icons.add),
      ),
    );
  }
}
