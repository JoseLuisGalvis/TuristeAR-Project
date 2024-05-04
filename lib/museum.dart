class Museum {
  int id;
  String title;
  String image;
  String address;
  String museumdescription;

  Museum({required this.id, required this.title, required this.image, required this.address, required this.museumdescription});

  factory Museum.fromJson(Map<String, dynamic> json) {
    return Museum(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      address: json['address'],
      museumdescription: json['museumdescription'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'address': address,
      'museumdescription': museumdescription
    };
  }

}
