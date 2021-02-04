class CheckListModel{
  String activityName;
  DateTime dateTime;
  bool isCompleted;

  CheckListModel(this.activityName, this.dateTime, this.isCompleted);

  @override
  String toString() {
    return 'CheckListModel{activityName: $activityName, dateTime: $dateTime, isCompleted: $isCompleted}';
  }
}