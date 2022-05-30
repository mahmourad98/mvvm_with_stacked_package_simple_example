import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled03/user_bloc/repository/user_repository.dart';
import 'model/user_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends HydratedBloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc(this.userRepository,) : super(UserInitialState(),) {
    on<LoadUserEvent>(_onLoadUSerEvent,);
  }

  _onLoadUSerEvent(LoadUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState(),);
    final userData = await userRepository.getUserData(event.userId,);
    if(userData != null){
      print('user data: $userData');
      emit(UserLoadedState(User.fromJson(userData),),);
    }
    else{
      emit(UserLoadedFailureState(),);
    }

  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    try{
      if(state is! UserLoadedState){
        final user = User.fromJson(json);
        return UserLoadedState(user);
      }
      else{
        throw Exception();
      }
    }
    catch(_){
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    if(state is UserLoadedState){
      return state.user.toJson();
    }
    else{
      return null;
    }
  }
}
