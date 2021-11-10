class Items {
  bool isChecked;
  String label;
  String date;

  Items(
    this.label,
    this.date,
    this.isChecked,
  );

  static List<Items> listItems = [
    Items(
      'Math',
      '910',
      false,
    ),
    Items(
      'Architecture',
      '910',
      false,
    ),
    Items(
      'Biology',
      '910',
      false,
    ),
    Items(
      'Flutter',
      '910',
      false,
    ),
    Items(
      'Artificial Intelligences',
      '910',
      false,
    ),
    Items(
      'Omg',
      '910',
      false,
    ),
    Items(
      'Math',
      '910',
      false,
    )
  ];
}
