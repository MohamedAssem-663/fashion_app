class CoverModel {
  final String image;
  final String title;

  CoverModel({required this.image, required this.title});
  static List<CoverModel> covers = [
    CoverModel(image: "assets/cover/cover3.png", title: "Best Sellers"),
    CoverModel(image: "assets/cover/cover1.png", title: "October Collection"),
    CoverModel(image: "assets/cover/cover2.png", title: "New Arrivals"),
  ];
}
