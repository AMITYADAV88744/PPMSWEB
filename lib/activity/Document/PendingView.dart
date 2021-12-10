import 'package:data_table_2/data_table_2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppmsweb/models/PendingTask.dart';
import 'package:ppmsweb/models/RecentFile.dart';

import '../../constants.dart';

class PendingDocument extends StatefulWidget{
  const PendingDocument({Key? key}) : super(key: key);

  @override
  _PendingDocumentState createState() => _PendingDocumentState();
}

class _PendingDocumentState extends State<PendingDocument> {
  String fileType = 'All';
  var fileTypeList = ['All', 'Image', 'Video', 'Audio','MultipleFile'];
  FilePickerResult? result;
  PlatformFile? file;
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
            "Pending  Task",
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
                  label: Text("Due Date"),
                ),
                DataColumn(
                  label: Text("Upload File"),
                ),
              ],
              rows: List.generate(
                demoPendingtask.length,
                    (index) => pendingFileDataRow(demoPendingtask[index]),
              ),
            ),
          ),
        ],
      ),
    );

  }
}

DataRow pendingFileDataRow(PendingTask fileInfo) {
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
      DataCell(Text(fileInfo.duedate!)),
      DataCell(RaisedButton(
          textColor: Colors.white,
          color: Colors.blue,
          child: Text('Choose File '),
          onPressed: () {


          }
      )),
    ],
  );
}