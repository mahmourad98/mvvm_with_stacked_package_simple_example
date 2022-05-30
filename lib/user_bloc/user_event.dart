part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadUserEvent extends UserEvent{
  final int userId;

  const LoadUserEvent(this.userId,);

  @override
  List<Object?> get props => [userId,];
}
