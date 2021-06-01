
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProfileState{}

class ProfileLoadingState extends ProfileState{}

class ProfileLoadedState extends ProfileState{
  ProfileLoadedState({@required this.userDataList});

  final Future<DocumentSnapshot<Map<String, dynamic>>>  userDataList;
}

class ProfileSuccessfulLogoutState extends ProfileState {}

