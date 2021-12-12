import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:funda_property_flutter/constants.dart';
import 'package:funda_property_flutter/models/kenmerken.dart';

class KenmerkenWidget extends StatelessWidget {
  final List<Kenmerken> kenmerkens;

  const KenmerkenWidget({
    Key? key,
    required this.kenmerkens,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kenmerken',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: ListView.builder(
          itemCount: kenmerkens.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            Kenmerken kenmerken = kenmerkens[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.blue.withOpacity(0.1),
                  padding: EdgeInsets.all(defaultPadding / 2),
                  margin: EdgeInsets.only(
                    top: defaultPadding,
                    bottom: defaultPadding / 2,
                  ),
                  child: Text(
                    kenmerken.titel,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.blue,
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: kenmerken.kenmerken.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    KenmerkenItem kenmerkenItem = kenmerken.kenmerken[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: defaultPadding / 2,
                          ),
                          child: Text(
                            kenmerkenItem.naam,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: defaultPadding * 1.5,
                          ),
                          child: Html(
                            data: kenmerkenItem.waarde!,
                            style: {
                              "span": Style(
                                fontSize: FontSize(12),
                              ),
                              "p": Style(
                                fontSize: FontSize(12),
                              ),
                              "*": Style(
                                fontSize: FontSize(12),
                              )
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
