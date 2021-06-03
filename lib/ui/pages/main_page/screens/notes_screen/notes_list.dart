import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/notes_bloc/notes_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/notes_bloc/notes_event.dart';
import 'package:flutter_mindpost/ui/bloc/notes_bloc/notes_state.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/notes_screen/widgets/notes_list_item.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/notes_screen/widgets/popup_menu_button_widget.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/notes_screen/widgets/search_textField.dart';
import 'package:flutter_mindpost/utils/app_localizations.dart';


class NotesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  PublicNotesBloc publicNotesBloc;
  TextEditingController searchController = TextEditingController();
  String selectedItemSorting = 'dislike';

  @override
  void initState() {
    super.initState();
    publicNotesBloc = BlocProvider.of<PublicNotesBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          PopupMenuButtonWidget(
            selectedItem: (String item) {
              setState(() {
                selectedItemSorting = item;
                publicNotesBloc.add(PublicNotesOrderByEvent(selectedItemSorting));
              });
            },
          ),
          const SizedBox(width: 15)
        ],
        backgroundColor: Colors.white38,
        elevation: 0,
        title: titleAppBar(AppLocalizations.of(context).translate('notes_feed_string')),
        centerTitle: true,
      ),
      body: BlocBuilder<PublicNotesBloc, NotesState>(
          bloc: publicNotesBloc,
          builder: (BuildContext context, NotesState state) {
            if(state is NoPublicNotesState) {
              return  Center(
                child: Text(AppLocalizations.of(context).translate('no_notes_feed_string')),
              );
            } if(state is LoadingPublicNotesState) {
              return circularProgress();
            }
            if (state is LoadedPublicNotesState) {
              return StreamBuilder<QuerySnapshot<Object>>(
                stream: state.loadedPublicNotesList,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return circularProgress();
                  } else if (snapshot.hasData) {
                    return SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          textFieldSearch(context, searchController),
                          Padding(
                            padding:
                            const EdgeInsets.only(top: 15, left: 50, right: 50),
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: 229,
                                    child: notesListItem(
                                        snapshot.data.docs[index], context),
                                  );
                                }),
                          ),
                        ],
                      ),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              );
            }
            return Container();
          }),
    );
  }
}
