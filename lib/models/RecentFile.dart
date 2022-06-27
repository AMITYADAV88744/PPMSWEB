
class RecentFile {
  final String? icon, title, date, size,uploadby;

  RecentFile({this.icon, this.title, this.date, this.size,this.uploadby});
}

List demoRecentFiles = [
  RecentFile(
    icon: "assets/icons/doc_file.svg",
    title: "Project Proposal",
    date: "10-08-2021",
    size: "3.5mb",
    uploadby: "Aman Negi",
  ),
  RecentFile(
    icon: "assets/icons/doc_file.svg",
    title: "Project Synopsis",
    date: "1-09-2021",
    size: "19.0mb",
    uploadby: "Aman Negi",
  ),
  RecentFile(
    icon: "assets/icons/doc_file.svg",
    title: "Research Paper-1",
    date: "10-09-2021",
    size: "32.5mb",
    uploadby: "Aman Negi",
  ),
  RecentFile(
    icon: "assets/icons/doc_file.svg",
    title: "Research Paper-2",
    date: "21-09-2021",
    size: "3.5mb",
    uploadby: "Aman Negi",
  ),
 /* RecentFile(
    icon: "assets/icons/doc_file.svg",
    title: "Rubics 1",
    date: "5-10-2021",
    size: "2.5mb",
    uploadby: "Aman Negi",
  ),
  RecentFile(
    icon: "assets/icons/doc_file.svg",
    title: "Rubics 2",
    date: "15-10-2021",
    size: "3.5mb",
    uploadby: "Amit Yadav",

  ),
  RecentFile(
    icon: "assets/icons/doc_file.svg",
    title: "Final Report",
    date: "15-11-2021",
    size: "34.5mb",
    uploadby: "Amit Yadav",

  ),

  */
];
