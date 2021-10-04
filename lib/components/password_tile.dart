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
                color: Colors.greenAccent,
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
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
