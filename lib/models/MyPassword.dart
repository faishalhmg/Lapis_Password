import 'package:flutter/material.dart';

import '../constants.dart';

class PasswordStorageInfo {
  final String svgSrc, title;
  final int numOfFiles, percentage;
  final Color color;

  PasswordStorageInfo({
    this.svgSrc,
    this.title,
    // this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyPassword = [
  PasswordStorageInfo(
    title: "Social Media",
    numOfFiles: 21,
    svgSrc: "assets/icons/Documents.svg",
    // totalStorage: "1.9GB",
    color: primaryColor,
    percentage: 21,
  ),
  PasswordStorageInfo(
    title: "Web Account",
    numOfFiles: 5,
    svgSrc: "assets/icons/google_drive.svg",
    // totalStorage: "2.9GB",
    color: Color(0xFFFFA113),
    percentage: 10,
  ),
  PasswordStorageInfo(
    title: "Wallet Account",
    numOfFiles: 30,
    svgSrc: "assets/icons/one_drive.svg",
    // totalStorage: "1GB",
    color: Color(0xFFA4CDFF),
    percentage: 30,
  ),
  PasswordStorageInfo(
    title: "Game Account",
    numOfFiles: 53,
    svgSrc: "assets/icons/drop_box.svg",
    // totalStorage: "7.3GB",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
];
