import 'package:funda_property_flutter/models/kenmerken.dart';
import 'package:funda_property_flutter/models/media.dart';

class Property {
  final String adres;
  final String postcode;
  final String plaats;
  final int woonOppervlakte;
  final int perceelOppervlakte;
  final String prijsGeformatteerd;
  final String volledigeOmschrijving;
  final List<Kenmerken> kenmerken;
  final List<Media> media;

  Property({
    required this.adres,
    required this.postcode,
    required this.plaats,
    required this.woonOppervlakte,
    required this.perceelOppervlakte,
    required this.prijsGeformatteerd,
    required this.volledigeOmschrijving,
    required this.kenmerken,
    required this.media,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    var kenmerkenItems = <Kenmerken>[];
    if (json['Kenmerken'] != null) {
      json['Kenmerken'].forEach((v) {
        kenmerkenItems.add(new Kenmerken.fromJson(v));
      });
    }

    var mediaItems = <Media>[];
    if (json['Media'] != null) {
      json['Media'].forEach((v) {
        mediaItems.add(new Media.fromJson(v));
      });
    }

    return Property(
      adres: json['Adres'],
      postcode: json['Postcode'],
      plaats: json['Plaats'],
      woonOppervlakte: json['WoonOppervlakte'],
      perceelOppervlakte: json['PerceelOppervlakte'],
      prijsGeformatteerd: json['PrijsGeformatteerd'],
      volledigeOmschrijving: json['VolledigeOmschrijving'],
      kenmerken: kenmerkenItems,
      media: mediaItems,
    );
  }
}
