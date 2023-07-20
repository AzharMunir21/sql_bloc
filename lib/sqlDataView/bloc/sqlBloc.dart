import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sql_bloc/sqlDataView/bloc/sqlEvent.dart';
import 'package:sql_bloc/sqlDataView/bloc/sqlState.dart';

class SqlBloc extends Bloc<SqlEvents, SqlStates> {
  SqlBloc() : super(SqlInitialState()) {
    on<SqlInsertEvent>((event, emit) {});
  }
}
