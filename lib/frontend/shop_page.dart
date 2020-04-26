
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:EcoPost/widgets/shopwidgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShopPage extends StatelessWidget {
    final title = Center(
    heightFactor: 2.5,
    child: Text('STORE', style: titleStyle),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.leaf),
                  color: Colors.white,
                  onPressed: () {
                    //TODO: Take to a point submission page
                    Navigator.of(context).pushNamed('/PointsPage');

                  },
                ),
                AutoSizeText("35+")
              ],
            ),
          )
        ],
        title: Text("STORE", style: titleStyle,),
      ),
          body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.fromLTRB(25.0, 35.0, 25.0, 15.0),
            child: Column(
              children: <Widget>[
                BigProductTile(),
                Divider(height: 55.0),
                SmallProductTiles(),
              ],
            ),
          ),
        ),
    );
  }
}


class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Hero(
                  tag: 'nature',
                  child: Image.asset(
                    'assets/nature.png',
                    height: MediaQuery.of(context).size.height / 2 + 65,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 55.0, 25.0, 15.0),
                  child: FloatingActionButton(
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    elevation: 0,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 15.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Save the Earth',
                          style: tileItemStyle.copyWith(fontSize: 28),
                        ),
                        ItemPricing(
                    textStyle: tileItemPriceStyle,
                    icon: FaIcon(FontAwesomeIcons.leaf),
                    price: 300,
                  ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'As a non-profit public benefit corporation, Save the Earth Foundation strives to help make the changes necessary to provide a healthier future for our planet by funding our Global Initiatives. We aim to fund the single most impacting environmental changes worldwide in an effort to slow and ultimately reverse the deterioration of our planet earth.',
                      style: descriptionStyle,
                    ),
                  ),
                  QuantitySelector(),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    height: 48,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Text(
                        'Donate',
                        style: buttonStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}