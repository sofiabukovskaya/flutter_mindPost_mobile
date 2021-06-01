import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/personal_note_bloc/personal_note_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/personal_note_bloc/personal_note_event.dart';
import 'package:flutter_mindpost/ui/bloc/personal_note_bloc/personal_note_state.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/notes_screen/widgets/search_textField.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/widgets/list_items/description_text.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/widgets/list_items/image_item.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/widgets/list_items/lock_icons.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/widgets/list_items/publishDate_text.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/widgets/list_items/title_text.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/personal_notes_screen/widgets/popup_menu_button.dart';


class PersonalNotesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PersonalNotesListState();
}

class PersonalNotesListState extends State<PersonalNotesList> {
  PersonalNotesBloc personalNotesBloc;
  TextEditingController searchController = TextEditingController();
  bool public;
  bool publicOrNot;
  String queryTextTitle;

  @override
  void initState() {
    super.initState();
    personalNotesBloc = BlocProvider.of<PersonalNotesBloc>(context);
    searchController.addListener(() {
      setState(() {
        queryTextTitle = searchController.text.toString();
      });
      print('$queryTextTitle');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          // iconButtonLogout(() {
          //   showDialog<dynamic>(
          //       context: context, builder: (_) => alertDialog(context));
          // }),
          PopupMenuButtonWidget(selectedItem: (bool selectedValue) {
            setState(() {
              publicOrNot = selectedValue;
              personalNotesBloc.add(PersonalNotesOrderBy(publicOrNot));
            });
          }),
          const SizedBox(width: 15)
        ],
        backgroundColor: Colors.white38,
        elevation: 0,
        title: titleAppBar('Personal notes'),
        centerTitle: true,
      ),
      body: BlocBuilder<PersonalNotesBloc, PersonalNotesState>(
          bloc: personalNotesBloc,
          builder: (BuildContext context, PersonalNotesState state) {
            if(state is LoadingPersonalNotesState) {
              return Center(
                child: circularProgress(),
              );
            }
            if (state is NoDataNotesState) {
              return const Center(
                child: Text('No notes yet'),
              );
            }
            if (state is ErrorInternetConnectionState) {
              return const Center(
                child: Text('No internet connection'),
              );
            }
            if (state is LoadedPersonalNotesState) {
              return StreamBuilder<QuerySnapshot<Object>>(
                stream: state.loadedNotesList,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child:  Text('No data'),);
                  } else if (snapshot.hasData) {
                    return SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          textFieldSearch(searchController),
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, right: 20),
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.docs.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    public = snapshot.data.docs[index]['public'];
                                    return Container(
                                        height: 150,
                                        width: 100,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          child: Stack(
                                            children: <Widget>[
                                              imageItem(),
                                              publishDateText(snapshot, index),
                                              titleText(snapshot, index),
                                              descriptionText(
                                                  context, snapshot, index),
                                              lockIcon(public)
                                            ],
                                          ),
                                        ));
                                  })),
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
