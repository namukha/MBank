import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'account_status_event.dart';
part 'account_status_state.dart';

class AccountStatusBloc extends Bloc<AccountStatusEvent, AccountStatusState> {
  AccountStatusBloc() : super(AccountStatusInitial()) {
    on<AccountStatusEvent>((event, emit) {
      // implement event handler
    });
  } 
}
