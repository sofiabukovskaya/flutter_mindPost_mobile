import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/profile_bloc/profile_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/profile_bloc/profile_event.dart';
import 'package:flutter_mindpost/ui/bloc/profile_bloc/profile_state.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/ui/pages/login_page/login_page.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/profile_screen/widgets/list_title.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/profile_screen/widgets/user_avatar.dart';


class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  ProfileBloc profileBloc;

  @override
  void initState() {
    super.initState();
    profileBloc = BlocProvider.of<ProfileBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showDialog<dynamic>(context: context, builder: (_){
                  return AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Do you wanna logout?'),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'No',
                            style: TextStyle(color: Colors.red),
                          )),
                      TextButton(
                          onPressed: () {
                            profileBloc.add(ProfileLogoutEvent());
                          },
                          child: const Text(
                            'Yes',
                            style: TextStyle(color: Colors.black87),
                          ))
                    ],
                    elevation: 8.0,
                  );
                });
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black87,
              ))
        ],
        backgroundColor: Colors.white38,
        elevation: 0,
        title: titleAppBar('Profile'),
        centerTitle: true,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
          bloc: profileBloc,
          builder: (BuildContext context, ProfileState state) {
            if (state is ProfileSuccessfulLogoutState) {
              Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => LoginPage()));
            }
            if (state is ProfileLoadedState) {
              return FutureBuilder<dynamic>(
                future: state.userDataList,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text('No data yet'),
                    );
                  } else if (snapshot.hasData) {
                    return SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          userAvatar(snapshot.data['name']),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                                width: 309,
                                height: 298,
                                child: Column(
                                  children: <Widget>[
                                    titleList('Name: ',
                                        '${snapshot.data['name'].toString()}'),
                                    titleList('Surname: ',
                                        '${snapshot.data['surname'].toString()}'),
                                    titleList('Nickname: ',
                                        '${snapshot.data['nickname'].toString()}'),
                                    titleList('Date of birth: ',
                                        '${snapshot.data['birthday'].toString()}'),
                                    titleList('Account: ',
                                        '${snapshot.data['account_type'].toString()}')
                                  ],
                                )),
                          )
                        ],
                      ),
                    );
                  }
                  return circularProgress();
                },
              );
            }
            return Container();
          }),
    );
  }
}
