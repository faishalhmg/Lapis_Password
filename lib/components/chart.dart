import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:save_password/data/password_item.dart';

import '../../../constants.dart';

class Chart extends StatefulWidget {
  const Chart({
    Key key,
  }) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  final Stream<int> _bids = (() async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield 1;
    await Future<void>.delayed(const Duration(seconds: 1));
  })();

  @override
  Widget build(BuildContext context) {
    final box = Hive.box(PasswordItem.boxName);

    return StreamBuilder<int>(
        stream: _bids,
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    PieChart(
                      PieChartData(
                        sectionsSpace: 0,
                        centerSpaceRadius: 90,
                        startDegreeOffset: -90,
                        sections: paiChartSelectionDatas,
                      ),
                    ),
                    Positioned.fill(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: defaultPadding),
                          Text(
                            "${box.length.toString()} Password",
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      color: Colors.lightGreen,
                                      fontWeight: FontWeight.w600,
                                      height: 0.5,
                                    ),
                          ),
                          Text(
                            "Tersimpan",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.lightGreen),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
              break;
            case ConnectionState.waiting:
              return SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    PieChart(
                      PieChartData(
                        sectionsSpace: 0,
                        centerSpaceRadius: 90,
                        startDegreeOffset: 90,
                        sections: paiChartSelectionDatas2,
                      ),
                    ),
                    Positioned.fill(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: defaultPadding),
                          Text(
                            "${box.length.toString()} Password",
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      color: Colors.lightGreen,
                                      fontWeight: FontWeight.w600,
                                      height: 0.5,
                                    ),
                          ),
                          Text(
                            "Tersimpan",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.lightGreen),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              return SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    PieChart(
                      PieChartData(
                        sectionsSpace: 0,
                        centerSpaceRadius: 90,
                        startDegreeOffset: 180,
                        sections: paiChartSelectionDatas3,
                      ),
                    ),
                    Positioned.fill(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: defaultPadding),
                          Text(
                            "${box.length.toString()} Password",
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      color: Colors.lightGreen,
                                      fontWeight: FontWeight.w600,
                                      height: 0.5,
                                    ),
                          ),
                          Text(
                            "Tersimpan",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.lightGreen),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
              break;
            case ConnectionState.done:
              return SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    PieChart(
                      PieChartData(
                        sectionsSpace: 0,
                        centerSpaceRadius: 90,
                        startDegreeOffset: -90,
                        sections: paiChartSelectionDatas3,
                      ),
                    ),
                    Positioned.fill(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: defaultPadding),
                          Text(
                            "${box.length.toString()} Password",
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      color: Colors.lightGreen,
                                      fontWeight: FontWeight.w600,
                                      height: 0.5,
                                    ),
                          ),
                          Text(
                            "Tersimpan",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.lightGreen),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
              break;
          }
        });
  }
}

List<PieChartSectionData> paiChartSelectionDatas2 = [
  PieChartSectionData(
    color: primaryColor,
    value: 0,
    showTitle: false,
    radius: 0,
  ),
  PieChartSectionData(
    color: Color(0xFF26E5FF),
    value: 0,
    showTitle: false,
    radius: 0,
  ),
  PieChartSectionData(
    color: Color(0xFFFFCF26),
    value: 0,
    showTitle: false,
    radius: 0,
  ),
  PieChartSectionData(
    color: Color(0xFFEE2727),
    value: 0,
    showTitle: false,
    radius: 0,
  ),
  PieChartSectionData(
    color: primaryColor.withOpacity(0.1),
    value: 0,
    showTitle: false,
    radius: 0,
  ),
];
List<PieChartSectionData> paiChartSelectionDatas = [
  PieChartSectionData(
    color: primaryColor,
    value: 5,
    showTitle: false,
    radius: 25,
  ),
  PieChartSectionData(
    color: Color(0xFF26E5FF),
    value: 5,
    showTitle: false,
    radius: 22,
  ),
  PieChartSectionData(
    color: Color(0xFFFFCF26),
    value: 5,
    showTitle: false,
    radius: 19,
  ),
  PieChartSectionData(
    color: Color(0xFFEE2727),
    value: 5,
    showTitle: false,
    radius: 16,
  ),
  PieChartSectionData(
    color: primaryColor.withOpacity(0.1),
    value: 5,
    showTitle: false,
    radius: 13,
  ),
];
List<PieChartSectionData> paiChartSelectionDatas3 = [
  PieChartSectionData(
    color: primaryColor,
    value: 10,
    showTitle: false,
    radius: 25,
  ),
  PieChartSectionData(
    color: Color(0xFF26E5FF),
    value: 10,
    showTitle: false,
    radius: 22,
  ),
  PieChartSectionData(
    color: Color(0xFFFFCF26),
    value: 8,
    showTitle: false,
    radius: 19,
  ),
  PieChartSectionData(
    color: Color(0xFFEE2727),
    value: 10,
    showTitle: false,
    radius: 16,
  ),
  PieChartSectionData(
    color: primaryColor.withOpacity(0.1),
    value: 10,
    showTitle: false,
    radius: 13,
  ),
];
List<PieChartSectionData> paiChartSelectionData4 = [
  PieChartSectionData(
    color: primaryColor,
    value: 25,
    showTitle: false,
    radius: 25,
  ),
  PieChartSectionData(
    color: Color(0xFF26E5FF),
    value: 20,
    showTitle: false,
    radius: 22,
  ),
  PieChartSectionData(
    color: Color(0xFFFFCF26),
    value: 10,
    showTitle: false,
    radius: 19,
  ),
  PieChartSectionData(
    color: Color(0xFFEE2727),
    value: 15,
    showTitle: false,
    radius: 16,
  ),
  PieChartSectionData(
    color: primaryColor.withOpacity(0.1),
    value: 25,
    showTitle: false,
    radius: 13,
  ),
];
