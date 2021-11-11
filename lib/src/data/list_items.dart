class Items {
  var imgUrl;
  String label;
  String date;
  bool isChecked;

  Items(
    this.label,
    this.date,
    this.imgUrl,
    this.isChecked,
  );

  static List<Items> listItems = [
    Items(
      'Math',
      '910',
      'https://cdn.maximonline.ru/b2/83/42/b28342c9bdf8a30ec86e46ca628b1c28/429x600_0xac120005_20216649461529078381.jpg',
      false,
    ),
    Items(
      'Architecture',
      '910',
      'https://cdn.maximonline.ru/01/8c/de/018cdef63ad8d1ce757c616fbea587fc/600x693_0xac120005_9403455921529078377.jpg',
      false,
    ),
    Items(
      'Biology',
      '910',
      'https://cdn.maximonline.ru/b5/f7/93/b5f793822739e26f1934cbd287bbba59/640x614_0xac120005_6967240851529078377.jpg',
      false,
    ),
    Items(
      'Flutter, isChecked = true',
      '910',
      'https://content.onliner.by/news/1100x5616/2c7c94d9a3b5ff71971790159c6847be.jpeg',
      true,
    ),
    Items(
      'Artificial Intelligences',
      '910',
      'https://cdn.maximonline.ru/bf/54/03/bf5403588c01fea62b674a7aa3c2aa9b/600x384_0xac120005_21444377311529078380.jpg',
      false,
    ),
    Items(
      'Omg',
      '910',
      'https://pre-party.com.ua/uploads/2017/Tanya_January/Zhdun_mem/003-Zhdun_mem.jpg',
      false,
    ),
    Items(
      'Math',
      '910',
      'https://pre-party.com.ua/uploads/2017/Tanya_January/Zhdun_mem/001-Zhdun_mem.jpg',
      false,
    )
  ];
}
