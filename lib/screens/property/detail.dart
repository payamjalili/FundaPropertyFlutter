import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:funda_property_flutter/constants.dart';
import 'package:funda_property_flutter/models/kenmerken.dart';
import 'package:funda_property_flutter/models/media.dart';
import 'package:funda_property_flutter/models/property.dart';
import 'package:funda_property_flutter/screens/property/widgets/header-image.dart';
import 'package:funda_property_flutter/screens/property/widgets/kenmerken.dart';
import 'package:funda_property_flutter/screens/property/widgets/media-button.dart';
import 'package:funda_property_flutter/services/get-property.dart';

class PropertyDetail extends StatefulWidget {
  PropertyDetail({Key? key}) : super(key: key);

  @override
  _PropertyDetailState createState() => _PropertyDetailState();
}

class _PropertyDetailState extends State<PropertyDetail> {
  late Future<Property> futureProperty;

  @override
  void initState() {
    super.initState();
    futureProperty = fetchProperty();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: FutureBuilder<Property>(
        future: futureProperty,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Property property = snapshot.data!;
            List<Media> photos =
                property.media.where((item) => item.categorie == 1).toList();

            return CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  // floating: false,
                  delegate: PersistentHeaderImageGallery(
                    photos: photos,
                    titleWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          property.adres,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          property.postcode + ' ' + property.plaats,
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        Html(
                          data: property.prijsGeformatteerd,
                          style: {
                            "span": Style(
                              fontWeight: FontWeight.bold,
                              fontSize: FontSize(18),
                            )
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MediaButton(
                                title: 'Foto\'s',
                                count: 39,
                                icon: Icons.image_outlined,
                              ),
                              MediaButton(
                                title: '360° foto\'s',
                                count: 18,
                                icon: Icons.redo_outlined,
                              ),
                              MediaButton(
                                title: 'Video',
                                icon: Icons.play_arrow,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    _openDialog(property.kenmerken);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: defaultPadding / 2,
                                      horizontal: defaultPadding * 1.5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(
                                        defaultPadding / 2,
                                      ),
                                    ),
                                    child: Text(
                                      'Kenmerken',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: defaultPadding / 2),
                              ),
                              Text(
                                'Omschrijving',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Html(data: property.volledigeOmschrijving),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  void _openDialog(List<Kenmerken> kenmerkens) async {
    await Navigator.of(context).push(
      MaterialPageRoute<String>(
        builder: (BuildContext context) {
          return KenmerkenWidget(kenmerkens: kenmerkens);
        },
        fullscreenDialog: true,
      ),
    );
  }
}
