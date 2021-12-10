class PendingTask{
  final String? icon, title, duedate,uploadfile;

  PendingTask({this.icon, this.title, this.duedate,this.uploadfile});
}

List demoPendingtask = [

  PendingTask(
    icon: "assets/icons/doc_file.svg",
    title: "Rubics 1",
    duedate: "5-10-2021",
    uploadfile: "",
  ),
  PendingTask(
    icon: "assets/icons/doc_file.svg",
    title: "Rubics 2",
    duedate: "15-10-2021",
    uploadfile: "",

  ),
  PendingTask(
    icon: "assets/icons/doc_file.svg",
    title: "Final Report",
    duedate: "15-11-2021",
    uploadfile: "Amit Yadav",

  ),
];
