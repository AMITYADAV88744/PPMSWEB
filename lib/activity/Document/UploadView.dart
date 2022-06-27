
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../../constants.dart';

class UploadDocument extends StatefulWidget{
  const UploadDocument({Key? key}) : super(key: key);

  @override
  UploadDocumentState createState() => UploadDocumentState();
}

class UploadDocumentState extends State<UploadDocument> {

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      child: FutureBuilder<List<ParseObject>>(
          future: getList(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator()),
                );
              default:
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Error..."),
                  );
                }
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text("No Data..."),
                  );
                } else {
                  var index = snapshot.data!.length;
                  var uploadTask = snapshot.data!;
                  int i = uploadTask.length;
                  for (int j = 0; j < i; j++) {
                    if (kDebugMode) {
                      print(uploadTask[j].get('title'));

                    }
                  }
                  return DataTable2(
                      columnSpacing: 50,
                      minWidth: width,
                      columns: const [
                        DataColumn(
                          label: Text("File Name"),
                        ),
                        DataColumn(
                          label: Text("Date"),
                        ),
                        DataColumn(
                          label: Text("Uplaoded By"),
                        ),
                      ],
                      rows: List.generate(i, (index) {
                        return DataRow(
                            cells: [
                              DataCell(
                                Text(
                                uploadTask[index].get('title'),
                                ),
                              ),
                              DataCell(
                                  Text(uploadTask[index].createdAt.toString(),)
                              ),
                              DataCell(
                                Text(uploadTask[index].get('student_id'))
                              ),
                            ]
                        );
                      }
                      ).toList()
                  );
                }
            }
          }
      ),
    );
  }


  Future<List<ParseObject>> getList() async {
    QueryBuilder<ParseObject> queryTodo =
    QueryBuilder<ParseObject>(ParseObject('StudentUpload'));
    final ParseResponse apiResponse = await queryTodo.query();
    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }
}
