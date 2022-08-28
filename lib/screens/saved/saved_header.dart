import 'package:flutter/material.dart';
import 'package:stickers/constants.dart';

class SavedHeader extends StatelessWidget {
  const SavedHeader({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      // It will cover 20% of our total height
      height: size.height * 0.3,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 100,
              left: kDefaultPadding,
              right: kDefaultPadding,
            ),
            height: (size.height * 0.4) - 27,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  "Saved Stickers",
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Spacer(),
                // add your app logo here
                // Image.asset("")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
