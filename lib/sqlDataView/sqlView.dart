import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sql_bloc/sqlDataView/bloc/sqlState.dart';

import 'bloc/sqlBloc.dart';

class SqlAllDbView extends StatefulWidget {
  const SqlAllDbView({Key? key}) : super(key: key);

  @override
  State<SqlAllDbView> createState() => _SqlAllDbViewState();
}

class _SqlAllDbViewState extends State<SqlAllDbView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            sqlForm();
          },
        ),
        body: BlocConsumer<SqlBloc, SqlStates>(
          listener: (BuildContext context, Object? state) {},
          builder: (BuildContext context, state) {
            return ListView.builder(
                itemCount: 30,
                itemBuilder: (_, index) {
                  return sqlTill(editTap: () {}, deleteTap: () {});
                });
          },
        ));
  }

  Widget sqlTill({required Function() editTap, required Function() deleteTap}) {
    return Container(
      color: Colors.blue,
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          const Text(
            "title",
            style: TextStyle(color: Colors.red),
          ),
          const Spacer(),
          IconButton(onPressed: editTap, icon: const Icon(Icons.edit)),
          IconButton(onPressed: deleteTap, icon: const Icon(Icons.delete)),
        ],
      ),
    );
  }

  Future sqlForm() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: const [
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share'),
            ),
            ListTile(
              leading: Icon(Icons.copy),
              title: Text('Copy Link'),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit'),
            ),
          ],
        );
      },
    );
  }
}
