part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitialState extends UserState {
  final User? user = null;

  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadedState extends UserState {
  final User user;

  const UserLoadedState(this.user);

  @override
  List<Object> get props => [user,];
}

class UserLoadedFailureState extends UserState {
  final String errorMessage = "Error Getting This User, Please Try Again,";
  @override
  List<Object> get props => [errorMessage,];
}
