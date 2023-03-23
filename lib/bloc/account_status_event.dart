part of 'account_status_bloc.dart';

@immutable
abstract class AccountStatusEvent {
  final int accIndex;

  const AccountStatusEvent(this.accIndex);

  List<Object> get props => [accIndex];
}
