import 'package:flutter/material.dart';
import 'package:funda_property_flutter/models/property.dart';
import 'package:funda_property_flutter/services/get-property.dart';

class PropertyDetail extends StatefulWidget {
  const PropertyDetail({Key? key}) : super(key: key);

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
    return Container(
      child: FutureBuilder<Property>(
        future: futureProperty,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.adres);
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          return Center(child: const CircularProgressIndicator());
        },
      ),
    );
  }
}
