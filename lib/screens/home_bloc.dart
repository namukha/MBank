// import 'dart:async';

import 'package:planner_app/bloc/account_status_bloc.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final reloadSubject = PublishSubject<AccountStatusState>();
}
