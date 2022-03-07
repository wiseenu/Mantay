import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wis/ListModel.dart';
import 'package:wis/database_service.dart';
import 'package:wis/Edit_model_page.dart';
import 'package:wis/Model_detail_page.dart';
import 'package:wis/Model_card_widget.dart';

class model extends StatefulWidget {
  const model({Key? key}) : super(key: key);

  @override
  _modelState createState() => _modelState();
}

class _modelState extends State<model> {
  late List<ModelList> models;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    MantayDatabase.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.models = await MantayDatabase.instance.readAllModelList();

    setState(() => isLoading = false);
  }

  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Ukuran baju"),
          actions: [Icon(Icons.search), SizedBox(width: 12)],
        ),
        body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : models.isEmpty
                  ? Text(
                      'No Notes',
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    )
                  : buildNotes(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddEditModelPage()),
            );

            refreshNotes();
          },
        ),
      );
  Widget buildNotes() => StaggeredGridView.countBuilder(
        padding: EdgeInsets.all(8),
        itemCount: models.length,
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          final modelList = models[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ModelDetailPage(modelId: modelList.id!),
              ));

              refreshNotes();
            },
            child: ModelCardWidget(modelList: modelList, index: index),
          );
        },
      );
}
