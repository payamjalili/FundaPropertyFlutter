class Property {
  final String adres;

  Property({
    required this.adres,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      adres: json['Adres'],
    );
  }
}
