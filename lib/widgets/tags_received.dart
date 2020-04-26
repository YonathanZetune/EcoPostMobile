import 'package:EcoPost/widgets/post_card.dart';
import 'package:flutter/material.dart';

class TagsReceived extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(

      child: SizedBox(
        height: 300,
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                new PostCard(),
                Divider(
                  thickness: 3,
                  indent: 12,
                  endIndent: 12,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
