import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/profile_bloc/profile_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/profile_bloc/profile_event.dart';
import 'package:flutter_mindpost/ui/bloc/profile_bloc/profile_state.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/ui/pages/login_page/login_page.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/profile_screen/widgets/alert_dialog_logout.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/profile_screen/widgets/title_list.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/profile_screen/widgets/user_avatar.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';

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
                showDialog<dynamic>(
                    context: context,
                    builder: (_) {
                      return AlertDialogLogout(
                        onClickedYesButton: () {
                          profileBloc.add(ProfileLogoutEvent());
                        },
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
        title: titleAppBar(AppLocalizations.of(context).translate('profile_string')),
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
                    return circularProgress();
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
                                    titleList( AppLocalizations.of(context).translate('name_string'),
                                        '${snapshot.data['name'].toString()}'),
                                    titleList( AppLocalizations.of(context).translate('surname_string'),
                                        '${snapshot.data['surname'].toString()}'),
                                    titleList( AppLocalizations.of(context).translate('nickname_string'),
                                        '${snapshot.data['nickname'].toString()}'),
                                    titleList(AppLocalizations.of(context).translate('date_birthday_string'),
                                        '${snapshot.data['birthday'].toString()}'),
                                    titleList( AppLocalizations.of(context).translate('account_string'),
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
