import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository.dart';
import 'package:flutter_mindpost/ui/bloc/registration_bloc/registration_event.dart';
import 'package:flutter_mindpost/ui/bloc/registration_bloc/registration_state.dart';
import 'dart:async';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final FirestoreRepository firestoreRepository = FirestoreRepository();

  RegistrationBloc({@required FirestoreRepository firestoreRepository}) : super(RegistrationEmptyState());

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is Submitted) {
      String name = event.name;
      String surname = event.surname;
      String nickname = event.nickname;
      String birthday = event.birthday;
      String password = event.password;
      String email = event.email;
      String phone = event.phone;
      RegistrationLoadingState();
      try {
        await firestoreRepository.signUp(name, surname, nickname, email, birthday, phone, password);
        yield RegistrationSuccessState();
      } catch (_) {
          yield RegistrationFailureState();
      }
    }
  }
}

