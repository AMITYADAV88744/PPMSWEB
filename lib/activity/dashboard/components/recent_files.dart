import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppmsweb/models/RecentFile.dart';
import '../../../constants.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      child: DataTable2(
        columnSpacing: 20,
        minWidth: 460,
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
        ],
        rows: List.generate(
          demoRecentFiles.length,
              (index) => recentFileDataRow(demoRecentFiles[index]),
        ),
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Text(
            fileInfo.title!
        ),
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
    ],
  );
}
