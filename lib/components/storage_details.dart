import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'chart.dart';
import 'storage_info_card.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Password Storage Details",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.lightGreen,
              ),
            ),
          ),
          Divider(),
          SizedBox(height: defaultPadding),
          Chart(),
          SizedBox(height: defaultPadding),
          // PasswordStorageInfoCard(
          //   svgSrc: "assets/icons/Documents.svg",
          //   title: "Social Media",
          //   amountOfFiles: "0.2mb",
          //   numOfFiles: 21,
          // ),
          // PasswordStorageInfoCard(
          //   svgSrc: "assets/icons/media.svg",
          //   title: "Game Account",
          //   amountOfFiles: "3 mb",
          //   numOfFiles: 53,
          // ),
          // PasswordStorageInfoCard(
          //   svgSrc: "assets/icons/folder.svg",
          //   title: "Wallet Account",
          //   amountOfFiles: "0.6 mb",
          //   numOfFiles: 30,
          // ),
          // PasswordStorageInfoCard(
          //   svgSrc: "assets/icons/folder.svg",
          //   title: "Web Acount",
          //   amountOfFiles: "0.1 mb",
          //   numOfFiles: 5,
          // ),
          // PasswordStorageInfoCard(
          //   svgSrc: "assets/icons/unknown.svg",
          //   title: "Others",
          //   amountOfFiles: "0",
          //   numOfFiles: 0,
          // ),
        ],
      ),
    );
  }
}
