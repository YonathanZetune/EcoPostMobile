import 'package:flutter/material.dart';
import 'package:EcoPost/frontend/shop_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


const titleStyle = TextStyle(
  fontSize: 23.0,
  fontWeight: FontWeight.w900,
  letterSpacing: 2.5,
);

const tileTitleStyle = TextStyle(
  fontSize: 18.5,
  fontWeight: FontWeight.w700,
);

const filterStyle = TextStyle(
  fontSize: 17.0,
);

const tileItemStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.w800,
  letterSpacing: 0.9,
);

const tileItemPriceStyle = TextStyle(
  fontSize: 23.0,
  fontWeight: FontWeight.w500,
);

const smallTileName = TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.w800,
);
const smallTilePrice = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

const descriptionStyle = TextStyle(
  fontSize: 16.5,
  color: Colors.black54,
  height: 1.35,
  fontWeight: FontWeight.w400,
);

const quantityIconStyle = TextStyle(
  fontSize: 21,
  fontWeight: FontWeight.w400,
  color: Colors.black,
);

const quantityStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

const buttonStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w400,
  color: Colors.white,
  wordSpacing: 2.0,
  letterSpacing: 0.9,
);

class SmallProductTiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Purchase',
                style: tileTitleStyle,
              ),
              Opacity(
                opacity: 0.6,
                child: Text(
                  'Show all',
                  style: filterStyle,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 5,
                  child: SmallProductTile(
                    name: 'Gift Card',
                    price: 149,
                    asset: 'assets/giftcard.png',
                    padding: const EdgeInsets.only(right: 14.0),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: SmallProductTile(
                    name: 'Audible',
                    price: 199,
                    asset: 'assets/audible.jpg',
                    padding: const EdgeInsets.only(left: 14.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BigProductTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailsScreen()));
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Donate',
                  style: tileTitleStyle,
                ),
                filter,
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Hero(
                  tag: 'nature',
                  child: Image.asset(
                    'assets/nature.png',
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width - 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Save the Earth',
                    style: tileItemStyle,
                  ),
                  ItemPricing(
                    textStyle: tileItemPriceStyle,
                    icon: FaIcon(FontAwesomeIcons.leaf),
                    price: 300,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get filter {
    return Opacity(
      opacity: 0.45,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Icon(Icons.sort),
          ),
          Text('Filter', style: filterStyle),
        ],
      ),
    );
  }
}

class SmallProductTile extends StatelessWidget {
  final String name;
  final int price;
  final String asset;
  final EdgeInsets padding;

  SmallProductTile({
    @required this.name,
    @required this.price,
    @required this.asset,
    @required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              asset,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('$name', style: smallTileName),
                ItemPricing(price: price, textStyle: smallTilePrice, icon: FaIcon(FontAwesomeIcons.leaf),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemPricing extends StatelessWidget {
  final int price;
  final TextStyle textStyle;
  final FaIcon icon;

  ItemPricing({
    @required this.price,
    @required this.textStyle,
    @required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Text(' $price', style: textStyle),


      ],
      
    );
  }
}

class QuantitySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Quantity', style: quantityStyle),
          Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.black.withOpacity(0.06),
                ),
                alignment: Alignment.center,
                width: 40,
                height: 40,
                child: Text('―', style: quantityIconStyle),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text('1',
                    style: quantityIconStyle.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 18)),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.black.withOpacity(0.05),
                ),
                alignment: Alignment.center,
                width: 36,
                height: 36,
                child: Text('+', style: quantityIconStyle),
              ),
            ],
          ),
        ],
      ),
    );
  }
}