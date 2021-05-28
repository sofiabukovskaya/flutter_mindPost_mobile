import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository_implementation.dart';
import 'package:flutter_mindpost/ui/bloc/registration_bloc/registration_event.dart';
import 'package:flutter_mindpost/ui/bloc/registration_bloc/registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationEmptyState());
  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is Submitted) {
      final String name = event.name;
      final String surname = event.surname;
      final String nickname = event.nickname;
      final String birthday = event.birthday;
      final String password = event.password;
      final String email = event.email;
      final String phone = event.phone;
      RegistrationLoadingState();
      try {
        FirestoreRepositoryImpl().signUp(name, surname, nickname, email, birthday, phone, password);
        yield RegistrationSuccessState();
      } catch (e) {
          yield RegistrationFailureState();
      }
    }
  }
}

