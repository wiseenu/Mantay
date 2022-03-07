import 'package:flutter/material.dart';
import 'package:wis/database_service.dart';
import 'package:wis/ListModel.dart';
import 'package:wis/Model_form_widget.dart';

class AddEditModelPage extends StatefulWidget {
  final ModelList? modelList;

  const AddEditModelPage({Key? key, this.modelList}) : super(key: key);

  @override
  _AddEditModelPageState createState() => _AddEditModelPageState();
}

class _AddEditModelPageState extends State<AddEditModelPage> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String uk1;
  late String uk2;
  late String uk3;

  @override
  void initState() {
    super.initState();

    name = widget.modelList?.name ?? '';
    uk1 = widget.modelList?.uk1 ?? '';
    uk2 = widget.modelList?.uk2 ?? '';
    uk3 = widget.modelList?.uk3 ?? '';
  }

  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: ModelFormWidget(
            name: name,
            uk1: uk1,
            uk2: uk2,
            uk3: uk3,
            onChangedName: (name) => setState(() => this.name = name),
            onChangedUk1: (uk1) => setState(() => this.uk1 = uk1),
            onChangedUk2: (uk2) => setState(() => this.uk2 = uk2),
            onChangedUk3: (uk3) => setState(() => this.uk3 = uk3),
          ),
        ),
      );
  Widget buildButton() {
    final isFormValid = name.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.grey.shade700,
        ),
        onPressed: addOrUpdateNote,
        child: Text('Save'),
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.modelList != null;

      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateNote() async {
    final note = widget.modelList!.copy(
      name: name,
      uk1: uk1,
      uk2: uk2,
      uk3: uk3,
    );

    await MantayDatabase.instance.update(note);
  }

  Future addNote() async {
    final modelList = ModelList(
      name: name,
      uk1: uk1,
      uk2: uk2,
      uk3: uk3,
    );

    await MantayDatabase.instance.create(modelList);
  }
}
