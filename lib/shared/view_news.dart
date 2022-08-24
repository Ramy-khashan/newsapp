import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewNewsItem extends StatelessWidget {
  const ViewNewsItem(
      {this.size,
      this.description,
      this.img,
      this.title,
      this.source,
      this.url,
      Key? key})
      : super(key: key);
  final Size? size;
  final String? img;
  final String? title;
  final String? source;
  final String? description;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        log(img.toString());
        if (await canLaunch(url!)) {
          await launch(url!);
        } else {
          Fluttertoast.showToast(msg: "Can't show in website.");
          throw "Error ing to go website.";
        }
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.only(
          bottom: size!.longestSide * .012,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: img!.isEmpty
                  ? Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: size!.longestSide * .01),
                        child: Text("No Image Provide",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.grey,
                              fontSize: size!.shortestSide * .035,
                            )),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          bottomLeft: Radius.circular(4)),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(img!, scale: 1),
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        height: 120,
                      ),
                    ),
            ),

            ///Title of news
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title!,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: size!.shortestSide * .04,
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      ///Description of news
                      Text(
                        description!.isEmpty ? "" : description!,
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: size!.shortestSide * .042,
                          color: Colors.grey,
                        ),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
