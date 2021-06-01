import 'package:bloc/bloc.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository_implementation.dart';
import 'package:flutter_mindpost/ui/bloc/profile_bloc/profile_event.dart';
import 'package:flutter_mindpost/ui/bloc/profile_bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState>{
  ProfileBloc() : super(ProfileLoadedState(userDataList: FirestoreRepositoryImpl().getUserData()));


  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async*{
    if(event is ProfileLogoutEvent) {
      await FirestoreRepositoryImpl().logout();
      yield ProfileSuccessfulLogoutState();
    }
  }
}