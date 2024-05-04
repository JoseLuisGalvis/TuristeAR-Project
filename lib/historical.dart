class Historical {
  int id;
  String title;
  String image;
  String address;
  String his_description;

  Historical(
      {required this.id, required this.title, required this.image, required this.address, required this.his_description});

  factory Historical.fromJson(Map<String, dynamic> json) {
    return Historical(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      address: json['address'],
      his_description: json['his_description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'address': address,
      'his_description': his_description
    };
  }
}