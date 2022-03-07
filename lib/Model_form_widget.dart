import 'package:flutter/material.dart';

class ModelFormWidget extends StatelessWidget {
  final String? name;
  final String? uk1;
  final String? uk2;
  final String? uk3;
  final ValueChanged<String> onChangedName;
  final ValueChanged<String> onChangedUk1;
  final ValueChanged<String> onChangedUk2;
  final ValueChanged<String> onChangedUk3;
  const ModelFormWidget(
      {Key? key,
      this.name = '',
      this.uk1,
      this.uk2,
      this.uk3,
      required this.onChangedName,
      required this.onChangedUk1,
      required this.onChangedUk2,
      required this.onChangedUk3})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTitle(),
              SizedBox(height: 8),
              buildUk1(),
              SizedBox(height: 16),
              buildUk2(),
              SizedBox(height: 16),
              buildUk3(),
              SizedBox(height: 16),
            ],
          ),
        ),
      );
  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: name,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Title',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 'The title cannot be empty' : null,
        onChanged: onChangedName,
      );

  Widget buildUk1() => TextFormField(
        maxLines: 5,
        initialValue: uk1,
        style: TextStyle(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Type Uk1...',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'The description cannot be empty'
            : null,
        onChanged: onChangedUk1,
      );
  Widget buildUk2() => TextFormField(
        maxLines: 5,
        initialValue: uk1,
        style: TextStyle(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Type Uk2...',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'The description cannot be empty'
            : null,
        onChanged: onChangedUk2,
      );
  Widget buildUk3() => TextFormField(
        maxLines: 5,
        initialValue: uk1,
        style: TextStyle(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Type Uk3...',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'The description cannot be empty'
            : null,
        onChanged: onChangedUk3,
      );
}
