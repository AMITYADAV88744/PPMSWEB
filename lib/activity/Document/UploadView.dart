import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppmsweb/models/RecentFile.dart';

import '../../constants.dart';

class UploadDocument extends StatefulWidget{
  const UploadDocument({Key? key}) : super(key: key);

  @override
  UploadDocumentState createState() => UploadDocumentState();
}

class UploadDocumentState extends State<UploadDocument> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery
        .of(context)
        .size;
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Completed  Task",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("File Name"),
                ),
                DataColumn(
                  label: Text("Date"),
                ),
                DataColumn(
                  label: Text("Size"),
                ),
                DataColumn(
                  label: Text("Uploaded By"),
                ),
              ],
              rows: List.generate(
                demoRecentFiles.length,
                    (index) => uploadFileDataRow(demoRecentFiles[index]),
              ),
            ),
          ),
        ],
      ),
    );

  }
}

DataRow uploadFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              fileInfo.icon!,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.title!),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date!)),
      DataCell(Text(fileInfo.size!)),
      DataCell(Text(fileInfo.uploadby!)),
    ],
  );
}