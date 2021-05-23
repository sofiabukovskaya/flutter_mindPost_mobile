
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindpost/data/repository/firestore_repository.dart';
import 'package:flutter_mindpost/ui/common/common_widgets.dart';
import 'package:flutter_mindpost/ui/pages/main_page/widgets/alert_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileScreenState();
  }
}

class ProfileScreenState extends State<ProfileScreen> {
 FirestoreRepository firestoreRepository = FirestoreRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.black87,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) =>
                          alertDialog(context, firestoreRepository));
                })
          ],
          backgroundColor: Colors.white38,
          elevation: 0,
          title: Text(
            'Profile',
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black87),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: firestoreRepository.getUserData(),
          builder: (context, snapshot) {
            if(!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if(snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                          height: 250,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.white70, Color(0x33157C76)])),
                          child: Center(
                            child: Column(
                              children: [
                                Padding(padding: EdgeInsets.only(top: 45)),
                                CircleAvatar(
                                  radius: 70.0,
                                  child: Image.asset('assets/user_photo.png'),
                                  backgroundColor: Colors.transparent,
                                ),
                                Padding(padding: EdgeInsets.only(top: 20)),
                                Text(
                                  '${snapshot.data['name'].toString()}',
                                  style: GoogleFonts.poppins(
                                      color: Colors.black87, fontSize: 18),
                                )
                              ],
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          width: 309,
                          height: 298,
                          child: Column(
                            children: [
                              titleList('Name: ', '${snapshot.data['name'].toString()}'),
                              titleList('Surname: ', '${snapshot.data['surname'].toString()}'),
                              titleList('Nickname: ', '${snapshot.data['nickname'].toString()}'),
                              titleList('Date of birth: ', '${snapshot.data['birthday'].toString()}'),
                              titleList('Account: ', '${snapshot.data['account_type'].toString()}')
                            ],
                          )),
                    )
                  ],
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        )

        );
  }
}
Widget titleList(String labelText, String item) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 28, left: 10),
        child: Text(labelText,
            style: GoogleFonts.poppins(
                color: Colors.black87, fontSize: 18)),
      ),
      Container(
        width: 150,
        margin: EdgeInsets.only(top: 28, left: 10),
        decoration: boxDecoration(), //
        child: Text(
          item,
          style: GoogleFonts.poppins(
              color: Colors.black87, fontSize: 18),
        ),
      )
    ],
  );
}