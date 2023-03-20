part of 'account_status_bloc.dart';

@immutable
class AccountStatusState {
  
  final String accIndex;
  final String accountType;
  final String country;
  final String amount;
  final String accountNum;

  AccountStatusState({
    this.accIndex = '0',
    this.accountType = 'Main account',
    this.country = 'mgl',
    this.amount = '800320',
    this.accountNum = '8000101010'
  });

  List<Object> get props => [
    accountType,
    country,
    amount,
    accountNum
  ];

}

class AccountStatusInitial extends AccountStatusState {}
