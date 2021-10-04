import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/models.dart';
import '../components/password_tile.dart';

class PasswordItemScreen extends StatefulWidget {
  final Function(PasswordItem) onCreate;
  final Function(PasswordItem) onUpdate;
  final PasswordItem originalItem;
  final bool isUpdating;

  const PasswordItemScreen({
    Key key,
    this.onCreate,
    this.onUpdate,
    this.originalItem,
  })  : isUpdating = (originalItem != null),
        super(key: key);

  @override
  _PasswordItemScreenState createState() => _PasswordItemScreenState();
}

class _PasswordItemScreenState extends State<PasswordItemScreen> {
  bool _isObscure = true;
  bool _isObscure2 = true;
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _importantController = TextEditingController();
  final _descController = TextEditingController();
  String _name = '';
  String _username = '';
  String _password = '';
  String _importantCode = '';
  String _desc = '';
  DateTime _dueDate = DateTime.now();

  @override
  void initState() {
    if (widget.originalItem != null) {
      _nameController.text = widget.originalItem.name;
      _name = widget.originalItem.name;
      _usernameController.text = widget.originalItem.username;
      _username = widget.originalItem.username;
      _passwordController.text = widget.originalItem.password;
      _password = widget.originalItem.password;
      _importantController.text = widget.originalItem.importantCode;
      _importantCode = widget.originalItem.importantCode;
      _descController.text = widget.originalItem.desc;
      _desc = widget.originalItem.desc;
      // _dueDate = date;
    }
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
    super.initState();
  }

  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              var passwordItems = PasswordItem()
                ..id = widget.originalItem?.id ?? const Uuid().v1()
                ..name = _nameController.text
                ..username = _usernameController.text
                ..password = _passwordController.text
                ..importantCode = _importantController.text
                ..desc = _descController.text
                ..date = DateTime.now();
              if (widget.isUpdating) {
                widget.onUpdate(passwordItems);
              } else {
                widget.onCreate(passwordItems);
              }
            },
          )
        ],
        elevation: 0.0,
        title: Text(
          'Password Item',
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            buildNameField(),
            buildUsurnameField(),
            buildPassField(),
            buildImportantCodeField(),
            buildDescField(),
            // buildDateField(context),
            // buildTimeField(context),
            const SizedBox(height: 10.0),

            // buildQuantityField(),
            const SizedBox(height: 16.0),
            PasswordTile(
              item: PasswordItem(
                  name: _name,
                  username: _username,
                  password: _password,
                  importantCode: _importantCode,
                  desc: _desc,
                  date: DateTime.now()),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nama akun',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        TextField(
          controller: _nameController,
          cursorColor: Colors.greenAccent,
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.greenAccent),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.greenAccent),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPassField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        TextField(
          obscureText: _isObscure,
          controller: _passwordController,
          cursorColor: Colors.greenAccent,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon:
                    Icon(_isObscure ? Icons.visibility : Icons.visibility_off)),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.greenAccent),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.greenAccent),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImportantCodeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Important Code',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        TextField(
          obscureText: _isObscure2,
          controller: _importantController,
          cursorColor: Colors.greenAccent,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure2 = !_isObscure2;
                  });
                },
                icon: Icon(
                    _isObscure2 ? Icons.visibility : Icons.visibility_off)),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.greenAccent),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.greenAccent),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildUsurnameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Username',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        TextField(
          controller: _usernameController,
          cursorColor: Colors.greenAccent,
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.greenAccent),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.greenAccent),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDescField() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Description',
        style: GoogleFonts.lato(fontSize: 28.0),
      ),
      TextField(
        controller: _descController,
        cursorColor: Colors.greenAccent,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.greenAccent),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.greenAccent),
          ),
        ),
      ),
    ]);
  }

  Widget buildDateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
              child: const Text('Select'),
              onPressed: () async {
                final currentDate = DateTime.now();
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: currentDate,
                  lastDate: DateTime(currentDate.year + 5),
                );
                setState(
                  () {
                    if (selectedDate != null) {
                      _dueDate = selectedDate;
                    }
                  },
                );
              },
            ),
          ],
        ),
        if (_dueDate != null)
          Text('${DateFormat('yyyy-MM-dd').format(_dueDate)}'),
      ],
    );
  }
}
