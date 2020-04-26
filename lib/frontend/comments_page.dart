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
  @override
  Widget build(BuildContext context) {
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
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: 7,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                CommentRow(),
                              ],
                            );
                          }),
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
                    decoration:
                        InputDecoration(labelText: 'Write a comment...'),
                    // onFieldSubmitted: addComment,
                  ),
                  trailing: OutlineButton(
                    onPressed: () {},
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
              child: Image(image: AssetImage('assets/avatar1.JPG')),
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
                      child: AutoSizeText("yonnieboy"),
                    ),
                    Container(),
                    Text(
                        "My name is Yonathan Zetune, and I love using Flutter!"),
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
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: ListTile(
        title: Row(
          children: [
            CircularProfileAvatar(
              '',
              child: Image(image: AssetImage('assets/avatar1.JPG')),
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
                      child: AutoSizeText("yonnieboy"),
                    ),
                    Container(),
                    Text("YOOOOO this is so cool I love it!"),
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
