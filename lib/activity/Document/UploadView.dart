
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/RecentFile.dart';

class UploadDocument extends StatefulWidget{
  const UploadDocument({Key? key}) : super(key: key);

  @override
  UploadDocumentState createState() => UploadDocumentState();
}

class UploadDocumentState extends State<UploadDocument> {
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      child: DataTable2(
        columnSpacing: defaultPadding,
        minWidth: 600,
        columns: const [
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
    );
  }
}

DataRow uploadFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
      Text(fileInfo.title!)
      ),
      DataCell(
          Text(
              fileInfo.date!
          )
      ),
      DataCell(
          Text(
              fileInfo.size!
          )
      ),
      DataCell(
          Text(
              fileInfo.uploadby!
          )
      ),
    ],
  );
}