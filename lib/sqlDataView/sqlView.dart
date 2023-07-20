import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sql_bloc/sqlDataView/bloc/sqlState.dart';

import '../Model/ModelClass.dart';
import 'bloc/sqlBloc.dart';
import 'bloc/sqlEvent.dart';

class SqlAllDbView extends StatefulWidget {
  const SqlAllDbView({Key? key}) : super(key: key);

  @override
  State<SqlAllDbView> createState() => _SqlAllDbViewState();
}

class _SqlAllDbViewState extends State<SqlAllDbView> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SqlBloc>(context, listen: false);
    return Scaffold(
        body: BlocConsumer<SqlBloc, SqlStates>(
      listener: (context, state) {
        bloc.add(SqlInsertEvent(row: {}));
        if (state is SqlInitialState) {
          bloc.add(SqlInsertEvent(row: {}));
        } else {}
      },
      builder: (BuildContext context, state) {
        return bloc.entrieNewList.isEmpty
            ? ListView.builder(
                itemCount: bloc.entrieNewList.length,
                itemBuilder: (_, index) {
                  return sqlTill(
                    index: index,
                    entriesList: bloc.entrieNewList,
                  );
                })
            : ListView.builder(
                itemCount: bloc.entrieNewList.length,
                itemBuilder: (_, index) {
                  return sqlTill(
                    index: index,
                    entriesList: bloc.entrieNewList,
                  );
                });
      },
    ));
  }

  Widget sqlTill({required int index, required List<Entries> entriesList}) {
    return Container(
      color: Colors.grey,
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Text(
            "${entriesList[index].aPI}",
            style: const TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
