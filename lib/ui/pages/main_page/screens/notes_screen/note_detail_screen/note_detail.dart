import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/note_detail_bloc/note_detail_bloc.dart';
import 'package:flutter_mindpost/ui/bloc/note_detail_bloc/note_detail_event.dart';
import 'package:flutter_mindpost/ui/bloc/note_detail_bloc/note_detail_state.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';

class NoteDetail extends StatefulWidget {
  const NoteDetail({Key key, this.snapshot}) : super(key: key);
  final QueryDocumentSnapshot<Object> snapshot;

  @override
  State<StatefulWidget> createState() {
    return NoteDetailScreenState();
  }
}

class NoteDetailScreenState extends State<NoteDetail> {
  NoteDetailBlock noteDetailBlock;

  String title = '';
  String description = '';
  int like;
  int dislike;
  bool clickedLike = false;
  bool clickedDislike = false;

  @override
  void initState() {
    super.initState();
    noteDetailBlock = BlocProvider.of<NoteDetailBlock>(context);

    title = widget.snapshot.get('title').toString();
    description = widget.snapshot.get('description').toString();
    like = widget.snapshot.get('like');
    dislike = widget.snapshot.get('dislike');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white38,
          elevation: 0,
        ),
        body: BlocBuilder<NoteDetailBlock, NoteDetailState>(
          bloc: noteDetailBlock,
          builder: (BuildContext context, NoteDetailState state) {
            if (state is NoInternetConnectionState) {
              return const Center(
                child: Text('No internet connection'),
              );
            }
            if (state is LoadingState) {
              return circularProgress();
            }
            if(state is LikingIsSuccessfulState) {
              Timer.run(() {
                 showSnackBar(context, 'You like this note');
              });
            } if (state is DislikingIsSuccessfulState) {
              Timer.run(() {
                showSnackBar(context, 'You dislike this note');
              });
            }
            return Container(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 20),
                    child: ListTile(
                      title: Text(
                        '$title',
                        style: textStyle(20.0, FontWeight.w600, Colors.black87),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        '${widget.snapshot.get('publish').toString()}',
                        style: textStyle(18.0, FontWeight.w500, Colors.black87),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 20),
                    child: ListTile(
                      leading: Text(
                        '$description',
                        maxLines: 3,
                        style: textStyle(18.0, FontWeight.w500, Colors.black87),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 150),
                            child: IconButton(
                              icon: const Icon(Icons.favorite),
                              onPressed: clickedLike
                                  ? null
                                  : () {
                                        noteDetailBlock.add(LikeEvent(
                                            widget.snapshot.id, like));
                                        setState(() {
                                          like++;
                                          clickedLike = true;
                                          clickedDislike = true;

                                        });
                                    },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 150),
                            child: Text('$like'),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 10),
                            child: IconButton(
                              icon: const Icon(Icons.cancel_outlined),
                              onPressed: clickedDislike
                                  ? null
                                  : () {
                                      noteDetailBlock.add(DislikeEvent(
                                          widget.snapshot.id, dislike));
                                      setState(() {
                                        dislike++;
                                        clickedDislike = true;
                                        clickedLike = true;
                                      });
                                    },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text('$dislike'),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          }
        ));
  }
}
