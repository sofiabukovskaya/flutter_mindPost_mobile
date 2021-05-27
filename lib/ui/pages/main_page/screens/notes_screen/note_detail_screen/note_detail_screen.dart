import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository.dart';
import 'package:flutter_mindpost/ui/bloc/note_detail_bloc/note_detail_bloc.dart';
import 'package:flutter_mindpost/ui/pages/main_page/screens/notes_screen/note_detail_screen/note_detail.dart';


class NoteDetailScreen extends StatefulWidget {
  NoteDetailScreen({Key key, this.snapshot}) : super(key: key);
  final QueryDocumentSnapshot<Object> snapshot;

  @override
  State<StatefulWidget> createState() {
    return NoteDetailScreenState();
  }
}

class NoteDetailScreenState extends State<NoteDetailScreen> {
  FirestoreRepository firestoreRepository = FirestoreRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NoteDetailBlock>(
        create: (BuildContext context) =>
            NoteDetailBlock(firestoreRepository: firestoreRepository),
        child: NoteDetail(snapshot: widget.snapshot,));
  }
}
