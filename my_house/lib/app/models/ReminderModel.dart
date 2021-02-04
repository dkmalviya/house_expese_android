class ReminderModel{
  String name;
  String occasion;
  bool isNotificationEnable;
  String occasionDate;

  ReminderModel(
      this.name, this.occasion, this.isNotificationEnable,this.occasionDate);

  @override
  String toString() {
    return 'ReminderModel{name: $name, occasionDate: $occasionDate, occasion: $occasion, isNotificationEnable: $isNotificationEnable}';
  }
}