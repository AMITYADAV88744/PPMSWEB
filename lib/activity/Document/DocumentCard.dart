import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppmsweb/Navigation_UI/components/header.dart';
import 'package:ppmsweb/activity/Document/PendingView.dart';
import '../../constants.dart';
import 'UploadView.dart';

class DocumentCard extends StatefulWidget {
  const DocumentCard({Key? key}) : super(key: key);

  @override
  _DocumentCardState createState() => _DocumentCardState();
}
final ScrollController _controllerOne = ScrollController();

class _DocumentCardState extends State<DocumentCard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        controller: _controllerOne,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      HeaderDP(),
                      const SizedBox(height: defaultPadding),
                      PendingDocument(),
                      SizedBox(height: defaultPadding,),
                      UploadDocument(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

