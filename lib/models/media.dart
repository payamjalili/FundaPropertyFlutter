class Media {
  final int categorie;
  final int contentType;
  final String id;
  final int indexNumber;
  final List<MediaItem> mediaItems;
  final int soort;

  Media({
    required this.categorie,
    required this.contentType,
    required this.id,
    required this.indexNumber,
    required this.mediaItems,
    required this.soort,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    var mediatems = <MediaItem>[];
    if (json['MediaItems'] != null) {
      json['MediaItems'].forEach((v) {
        mediatems.add(new MediaItem.fromJson(v));
      });
    }

    return Media(
      categorie: json['Categorie'],
      contentType: json['ContentType'],
      id: json['Id'],
      indexNumber: json['IndexNumber'],
      mediaItems: mediatems,
      soort: json['Soort'],
    );
  }
}

class MediaItem {
  final String url;
  final String? urlSecure;
  final int category;
  final int height;
  final int width;

  MediaItem({
    required this.url,
    required this.urlSecure,
    required this.category,
    required this.height,
    required this.width,
  });

  factory MediaItem.fromJson(Map<String, dynamic> json) {
    return MediaItem(
      url: json['Url'],
      urlSecure: json['UrlSecure'],
      category: json['Category'],
      height: json['Height'],
      width: json['Width'],
    );
  }
}
