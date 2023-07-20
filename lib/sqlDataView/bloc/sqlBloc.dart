import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sql_bloc/sqlDataView/bloc/sqlEvent.dart';
import 'package:sql_bloc/sqlDataView/bloc/sqlState.dart';

import '../../Model/ModelClass.dart';
import 'package:http/http.dart' as http;

import '../../sqlDb/sqlDb.dart';

class SqlBloc extends Bloc<SqlEvents, SqlStates> {
  List<Entriess> entriessList = [];
  List<Entries> entrieNewList = [];

  SqlBloc() : super(SqlInitialState()) {
    on<SqlInsertEvent>((event, emit) async {
      print("hgflshd");
      await getRatesApi();
    });
    add(SqlInsertEvent(row: {}));
  }

  Future getRatesApi() async {
    final connectivityResult = await checkConnection();
    try {
      if (connectivityResult) {
        final http.Response response =
            await http.get(Uri.parse("https://api.publicapis.org/entries"));
        var data = jsonDecode(response.body);
        entriessList.clear();
        entrieNewList.clear();
        entriessList.add(Entriess.fromJson(data));
        entrieNewList.addAll(entriessList[0].entries ?? []);
        Map<String, dynamic> map = {};

        entriessList[0].entries?.forEach((item) {
          map['API'] = item.aPI.toString();
          map['Description'] = item.description.toString();
          map['Auth'] = item.auth.toString();
          map['HTTPS'] = item.hTTPS.toString();
          map['Cors'] = item.cors.toString();
          map['Link'] = item.link.toString();
          map['Category'] = item.category.toString();
        });

        DbHelper().insertRecord(map);

        // getDataDb();
      } else {
        getDataDb();
      }
    } catch (e) {
      print(e);
    }
  }

  // get data from db
  Future getDataDb() async {
    var getData = await DbHelper().readRecord();
    final dataFromJsonToMap = jsonEncode(getData);
    List<Entries> listFromDb = [];
    entrieNewList.clear();
    List<Map<String, dynamic>> maps = [];
    maps =
        List<Map<String, dynamic>>.from(jsonDecode(dataFromJsonToMap)).toList();
    entrieNewList = List.generate(maps.length, (i) {
      return Entries(
        id: maps[i]['Id'],
        aPI: maps[i]['API'],
        auth: maps[i]['Auth'],
        category: maps[i]['Category'],
        cors: maps[i]['Cors'],
        description: maps[i]['Description'],
        hTTPS: maps[i]['HTTPS'],
        link: maps[i]['Link'],
      );
    });
  }

  static Future<bool> checkConnection() async {
    var connection = await Connectivity().checkConnectivity();
    if (connection == ConnectivityResult.mobile ||
        connection == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
