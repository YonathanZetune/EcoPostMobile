import 'package:EcoPost/utilities/post.dart';
import 'package:EcoPost/utilities/requests.dart';
import 'package:EcoPost/widgets/post_card.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: Requests.getAllPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> projectSnap) {
          switch (projectSnap.connectionState) {
            case ConnectionState.none:
              return new Text('No Data');
            case ConnectionState.waiting:
              return new CircularProgressIndicator();
            default:
              if (projectSnap.hasError)
                return new Text('Error: ${projectSnap.error}');
              else
                return ListView.builder(
                  itemCount: projectSnap.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        new PostCard(
                          timestamp: projectSnap.data[index].timestamp,
                          hashtag: projectSnap.data[index].hashtag,
                          handle: projectSnap.data[index].handle,
                          description: projectSnap.data[index].description,
                          location: projectSnap.data[index].location,
                          likes: projectSnap.data[index].likes,


                          lat: projectSnap.data[index].lat,
                          lon: projectSnap.data[index].lon,



                          image: projectSnap.data[index].image,
                          name: projectSnap.data[index].name,
                        ),
                        Divider(
                          thickness: 3,
                          indent: 12,
                          endIndent: 12,
                        )
                      ],
                    );
                  },
                );
          }
        },
      ),
    );
  }
}
