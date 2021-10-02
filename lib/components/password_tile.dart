import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/password_item.dart';

class PasswordTile extends StatelessWidget {
  final PasswordItem item;
  // final Function(bool) onComplete;
  final TextDecoration textDecoration;

  PasswordTile({
    Key key,
    this.item,
    //  required this.onComplete,
  })  : textDecoration =
            item.Lock ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 5.0,
                color: item.color,
              ),
              const SizedBox(width: 16.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: GoogleFonts.lato(
                        decoration: textDecoration,
                        fontSize: 21.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4.0),
                  // const SizedBox(height: 4.0),
                  // buildImportance(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget buildImportance() {
  //   if (item.importance == Importance.low) {
  //     return Text(
  //       'Low',
  //       style: GoogleFonts.lato(decoration: textDecoration),
  //     );
  //   } else if (item.importance == Importance.medium) {
  //     return Text(
  //       'Medium',
  //       style: GoogleFonts.lato(
  //           fontWeight: FontWeight.w800, decoration: textDecoration),
  //     );
  //   } else if (item.importance == Importance.high) {
  //     return Text(
  //       'High',
  //       style: GoogleFonts.lato(
  //         color: Colors.red,
  //         fontWeight: FontWeight.w900,
  //         decoration: textDecoration,
  //       ),
  //     );
  //   } else {
  //     throw Exception('This importance type does not exist');
  //   }
  // }

}
