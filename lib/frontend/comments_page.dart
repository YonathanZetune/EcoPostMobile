import 'package:EcoPost/utilities/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentsPage extends StatefulWidget {
  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  List<CommentRow> comments = new List<CommentRow>();
  String newComm = "";

  @override
  Widget build(BuildContext context) {
    setState(() {
      CommentRow cr1 = new CommentRow(
          image: 'neil.jpg',
          comment: "Awesome work Julia, the stars are aligning in our favor!",
          name: "Neil D.");
      comments.add(cr1);
      CommentRow cr2 = new CommentRow(
          image: 'girl1.png',
          comment:
              "I love the poster, I will challenge my friends to do the same:)",
          name: "Anna B.");
      comments.add(cr2);
      CommentRow cr3 = new CommentRow(
          image: 'mel.png',
          comment: "Would love to help out next time, send me a message!",
          name: "Mel G.");
      comments.add(cr3);
    });

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "COMMENTS",
          style: GoogleFonts.teko(
              fontWeight: FontWeight.bold, letterSpacing: 6, fontSize: 30),
        ),
        backgroundColor: Constants.themeGreen,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(child: TitleCommentRow()),
                      Divider(
                        color: Colors.grey,
                      ),
                      Container(
                        child: ListView(
                          shrinkWrap: true,
                          children: comments,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: ListTile(
                  title: TextFormField(
                    // controller: _commentController,
//                    decoration:
//                        InputDecoration(labelText: 'Write a comment...'),
                    onFieldSubmitted: (comm) {
                      setState(() {
                        newComm = comm;
                      });
                    },
                  ),
                  trailing: OutlineButton(
                    onPressed: () {
                      print("PRESSED");
//                      print(newComm);
                      setState(() {
                      CommentRow cr1 = new CommentRow(
                          image: 'pfp.png', comment: "hi", name: "Dylan T.");
                      comments.add(cr1);

                      });
                    },
                    borderSide: BorderSide.none,
                    child: Text("Post"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleCommentRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: ListTile(
        title: Row(
          children: [
            CircularProfileAvatar(
              '',
              child: Image(
                  image: AssetImage(
                    'assets/hill.png',
                  ),
                  fit: BoxFit.cover),
              radius: 25,
              borderColor: Constants.themeGreen,
              borderWidth: 4,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                      child: AutoSizeText("Julia Hill"),
                    ),
                    Container(),
                    Text(
                      "Amazing time working with California Recycling Inc! Can't wait til next month!",
                      style: GoogleFonts.monda(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommentRow extends StatelessWidget {
  final String image;
  final String comment;
  final String name;

  CommentRow({this.image, this.comment, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: ListTile(
        title: Row(
          children: [
            CircularProfileAvatar(
              '',
              child: Image.asset(
                "assets/$image",
                fit: BoxFit.cover,
              ),
              radius: 25,
              borderColor: Constants.themeGreen,
              borderWidth: 4,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                      child: AutoSizeText(name),
                    ),
                    Container(),
                    Text(
                      comment,
                      style: GoogleFonts.monda(),
                    ),
                    Row(
                      children: [
                        Text('Reply'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
