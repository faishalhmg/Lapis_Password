import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:save_password/data/password_item.dart';

import '../constants.dart';

class RecentAdded extends StatelessWidget {
  const RecentAdded({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var box = Hive.box(PasswordItem.boxName);
    if (box.length == 0) {
      return Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            "DATA KOSONG",
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: Colors.lightGreen),
          ),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recent Add",
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(color: Colors.lightGreen),
            ),
            SizedBox(
              width: double.infinity,
              child: DataTable2(
                columnSpacing: defaultPadding,
                minWidth: 600,
                columns: [
                  DataColumn(
                    label: Text("Name",
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: Colors.lightGreen)),
                  ),
                  DataColumn(
                    label: Text("Date",
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: Colors.lightGreen)),
                  ),
                  DataColumn(
                    label: Text("Desc",
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: Colors.lightGreen)),
                  ),
                ],
                rows: List.generate(
                    box.length,
                    (index) =>
                        recentPasswordDataRow(box.values.toList()[index])),
                dataTextStyle: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: Colors.lightGreen),
              ),
            ),
          ],
        ),
      );
    }
  }
}

DataRow recentPasswordDataRow(PasswordItem passwordItem) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(passwordItem.name)),
          ],
        ),
      ),
      DataCell(Text(passwordItem.date.toString())),
      DataCell(Text(passwordItem.desc)),
    ],
  );
}
