class Person {
  String name;
  String? present;
  DateTime birthdayDt;

  Person(this.name, this.present, this.birthdayDt);

  getAgeToBe() => (DateTime.now().year - birthdayDt.year).ceil();

  getBirthdayThisYear() =>
      birthdayDt.add(Duration(days: (365.25 * getAgeToBe()).ceil()));

  getDaysLeft() => (DateTime.now().isAfter(getBirthdayThisYear()))
      ? getBirthdayThisYear()
          .add(Duration(days: 365))
          .difference(DateTime.now())
          .inDays
      : getBirthdayThisYear().difference(DateTime.now()).inDays;
}
