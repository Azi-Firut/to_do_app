class ItemData {
  final bool isChecked;
  final String imgUrl;
  final String dateNow;
  final String label;

  const ItemData({
    required this.isChecked,
    required this.imgUrl,
    required this.dateNow,
    required this.label,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemData &&
          runtimeType == other.runtimeType &&
          isChecked == other.isChecked &&
          imgUrl == other.imgUrl &&
          dateNow == other.dateNow &&
          label == other.label);

  @override
  int get hashCode =>
      isChecked.hashCode ^ imgUrl.hashCode ^ dateNow.hashCode ^ label.hashCode;

  @override
  String toString() {
    return 'ItemData{' +
        ' isChecked: $isChecked,' +
        ' imgUrl: $imgUrl,' +
        ' dateNow: $dateNow,' +
        ' label: $label,' +
        '}';
  }

  ItemData copyWith({
    bool? isChecked,
    String? imgUrl,
    String? dateNow,
    String? label,
  }) {
    return ItemData(
      isChecked: isChecked ?? this.isChecked,
      imgUrl: imgUrl ?? this.imgUrl,
      dateNow: dateNow ?? this.dateNow,
      label: label ?? this.label,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isChecked': this.isChecked,
      'imgUrl': this.imgUrl,
      'dateNow': this.dateNow,
      'label': this.label,
    };
  }

  factory ItemData.fromMap(Map<String, dynamic> map) {
    return ItemData(
      isChecked: map['isChecked'] as bool,
      imgUrl: map['imgUrl'] as String,
      dateNow: map['dateNow'] as String,
      label: map['label'] as String,
    );
  }
}

// class Items {
//   var imgUrl;
//   String label;
//   String date;
//   bool isChecked;
//
//   Items(
//     this.label,
//     this.date,
//     this.imgUrl,
//     this.isChecked,
//   );
//
//   static List<Items> listItems = [
//     Items(
//       'Math',
//       '910',
//       'https://cdn.maximonline.ru/b2/83/42/b28342c9bdf8a30ec86e46ca628b1c28/429x600_0xac120005_20216649461529078381.jpg',
//       false,
//     ),
//     Items(
//       'Architecture',
//       '910',
//       'https://cdn.maximonline.ru/01/8c/de/018cdef63ad8d1ce757c616fbea587fc/600x693_0xac120005_9403455921529078377.jpg',
//       false,
//     ),
//     Items(
//       'Biology',
//       '910',
//       'https://cdn.maximonline.ru/b5/f7/93/b5f793822739e26f1934cbd287bbba59/640x614_0xac120005_6967240851529078377.jpg',
//       false,
//     ),
//     Items(
//       'Flutter',
//       '910',
//       'https://content.onliner.by/news/1100x5616/2c7c94d9a3b5ff71971790159c6847be.jpeg',
//       false,
//     ),
//     Items(
//       'Artificial Intelligences',
//       '910',
//       'https://cdn.maximonline.ru/bf/54/03/bf5403588c01fea62b674a7aa3c2aa9b/600x384_0xac120005_21444377311529078380.jpg',
//       false,
//     ),
//     Items(
//       'Omg',
//       '910',
//       'https://pre-party.com.ua/uploads/2017/Tanya_January/Zhdun_mem/003-Zhdun_mem.jpg',
//       false,
//     ),
//     Items(
//       'Math',
//       '910',
//       'https://pre-party.com.ua/uploads/2017/Tanya_January/Zhdun_mem/001-Zhdun_mem.jpg',
//       false,
//     )
//   ];
// } // Static list

// class ItemsFromFireBase {
//   var imgUrl;
//   String label;
//   String date;
//   bool isChecked;
//
//   ItemsFromFireBase(
//     this.label,
//     this.date,
//     this.imgUrl,
//     this.isChecked,
//   );
//
//   static List<ItemsFromFireBase> listItems = [
//     ItemsFromFireBase(
//       'Math',
//       '910',
//       'https://pre-party.com.ua/uploads/2017/Tanya_January/Zhdun_mem/001-Zhdun_mem.jpg',
//       false,
//     ),
//     ItemsFromFireBase(
//       'dfdgdfgdfghd',
//       '910',
//       'https://pre-party.com.ua/uploads/2017/Tanya_January/Zhdun_mem/001-Zhdun_mem.jpg',
//       false,
//     )
//   ];
// }
