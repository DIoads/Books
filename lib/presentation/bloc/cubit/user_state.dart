part of 'user_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class UserState extends Equatable {
  final FormStatus formStatus;
  final MyUser currentUser = MyUser();
  final AuthServicesInterface auth = FirebaseAuthService();

  UserState(
      {this.formStatus = FormStatus.invalid,
      MyUser? currentUser,
      AuthServicesInterface? auth});

  UserState copyWith(
          {FormStatus? formStatus,
          MyUser? currentUser,
          AuthServicesInterface? auth}) =>
      UserState(
          formStatus: formStatus ?? this.formStatus,
          currentUser: currentUser ?? this.currentUser,
          auth: auth ?? this.auth);

  @override
  List<Object> get props => [formStatus, currentUser];
}
