
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Navigation_UI/components/header.dart';
import '../../constants.dart';
import 'PendingView.dart';
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
                    children:  [
                      const HeaderDP(),
                      const SizedBox(height: defaultPadding),
                      Container(
                          padding: const EdgeInsets.all(defaultPadding),
                          decoration: const BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                            Center(
                              child:  Text('Pending Task')
                            ),
                              SizedBox(
                                height: 250,
                                child: PendingDocument(),
                              )
                            ]
                          )
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      Container(
                          padding: const EdgeInsets.all(defaultPadding),
                          decoration: const BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Center(
                                    child:  Text('Uplaoded Document')
                                ),
                                SizedBox(
                                  height: 250,
                                  child: UploadDocument(),
                                )
                              ]
                          )
                      ),
                      const SizedBox(height: defaultPadding,),
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

