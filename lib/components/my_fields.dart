import 'package:flutter/material.dart';
import 'package:save_password/models/MyPassword.dart';

import '../../../constants.dart';
import 'app_info_card.dart';

class MyPassword extends StatefulWidget {
  const MyPassword({
    Key key,
  }) : super(key: key);

  @override
  _MyPasswordState createState() => _MyPasswordState();
}

class _MyPasswordState extends State<MyPassword> {
  bool _running = true;

  Stream<String> _clock() async* {
    while (_running) {
      await Future<void>.delayed(Duration(seconds: 1));
      DateTime _now = DateTime.now();
      yield "${_now.hour} : ${_now.minute} : ${_now.second}";
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Password",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            StreamBuilder(
                stream: _clock(),
                builder: (context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  return Text(
                    snapshot.data,
                    style: TextStyle(fontSize: 30, color: Colors.lightGreen),
                  );
                })
            // ElevatedButton.icon(
            //   style: TextButton.styleFrom(
            //     padding: EdgeInsets.symmetric(
            //       horizontal: defaultPadding * 1.5,
            //       vertical: defaultPadding,
            //     ),
            //   ),
            //   onPressed: () {},
            //   icon: Icon(Icons.add),
            //   label: Text("Add New"),
            // ),
          ],
        ),
        SizedBox(height: defaultPadding),
        FileInfoCardGridView(
          crossAxisCount: _size.width < 650 ? 2 : 4,
          childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyPassword.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) =>
          PasswordInfoCard(info: demoMyPassword[index]),
    );
  }
}
