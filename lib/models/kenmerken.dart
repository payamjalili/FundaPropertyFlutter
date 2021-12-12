class Kenmerken {
  final String? ad;
  final List<KenmerkenItem> kenmerken;
  final int lokNummer;
  final String titel;

  Kenmerken({
    this.ad,
    required this.kenmerken,
    required this.lokNummer,
    required this.titel,
  });

  factory Kenmerken.fromJson(Map<String, dynamic> json) {
    var kenmerkenItems = <KenmerkenItem>[];
    if (json['Kenmerken'] != null) {
      json['Kenmerken'].forEach((v) {
        kenmerkenItems.add(new KenmerkenItem.fromJson(v));
      });
    }

    return Kenmerken(
      ad: json['Ad'],
      kenmerken: kenmerkenItems,
      lokNummer: json['LokNummer'],
      titel: json['Titel'],
    );
  }
}

class KenmerkenItem {
  final String naam;
  final String? naamCss;
  final String? waarde;
  final String? waardeCss;

  KenmerkenItem({
    required this.naam,
    required this.naamCss,
    required this.waarde,
    required this.waardeCss,
  });

  factory KenmerkenItem.fromJson(Map<String, dynamic> json) {
    return KenmerkenItem(
      naam: json['Naam'],
      naamCss: json['NaamCss'],
      waarde: json['Waarde'],
      waardeCss: json['WaardeCss'],
    );
  }
}
