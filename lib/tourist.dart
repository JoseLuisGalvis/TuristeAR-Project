class Tourist {
  int id;
  String title;
  String image;
  String address;
  String tur_description;

  Tourist({required this.id, required this.title, required this.image, required this.address, required this.tur_description});

  factory Tourist.fromJson(Map<String, dynamic> json) {
    return Tourist(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      address: json['address'],
      tur_description: json['tur_description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'address': address,
      'tur_description': tur_description
    };
  }

}