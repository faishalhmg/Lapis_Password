import 'package:flutter/material.dart';
import 'package:save_password/components/my_fields.dart';
import 'package:save_password/components/storage_details.dart';
import 'package:save_password/models/recent_added.dart';

import '../constants.dart';
import '../responsive.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      MyPassword(),
                      SizedBox(height: defaultPadding),
                      RecentAdded(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) StorageDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: StorageDetails(),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
