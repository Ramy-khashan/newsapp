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
    return Card(
      elevation: 25,
      margin: EdgeInsets.only(
        bottom: size!.longestSide * .012,
      ),
      child: Column(
        children: [
          img!.isEmpty
              ? Center(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: size!.longestSide * .01),
                    child: Text("No Image Provide",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                          fontSize: size!.shortestSide * .05,
                        )),
                  ),
                )
              : InkWell(
                  onTap: () async {
                    if (await canLaunch(url!)) {
                      await launch(url!);
                    } else {
                      Fluttertoast.showToast(
                          msg: "Error occured trying to go website.");
                      throw "Error occured trying to go website.";
                    }
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(img!),
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
                      height: size!.longestSide * .35,
                      width: double.infinity,
                    ),
                  ),
                ),
          Text(
            title!,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: size!.shortestSide * .05,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            description!.isEmpty ? "" : description!,
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: size!.shortestSide * .042,
              color: Colors.grey,
            ),
          ),
          source!.isEmpty
              ? Text(
                  source!,
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: size!.shortestSide * .042,
                    color: Colors.grey,
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
