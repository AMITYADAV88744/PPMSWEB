
import 'dart:convert';
List<PendingTask> pendingTaskFromJson(String str) =>
    List<PendingTask>.from(json.decode(str).map((x) => PendingTask.fromJson(x) as Map<String,dynamic>));

String pendingTaskToJson(List<PendingTask> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PendingTask {
  PendingTask({
    required this.title,
    required this.duedate,
  });

  String title;
  String duedate;

  factory PendingTask.fromJson(Map<String, dynamic> json) => PendingTask(
    title: json["title"],
    duedate: json["duedate"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "duedate": duedate,
  };
}
