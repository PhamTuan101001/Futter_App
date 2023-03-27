class ToDo {
  String? id;
  String? todoText;
  dynamic deadline;
  bool isDone;
  bool checkTime;

  ToDo({
    required this.id,
    required this.todoText,
    required this.deadline,
    this.isDone = false,
    this.checkTime = false,
  });

  static List<ToDo> todoList() {
    return [
      // ToDo(
      //     id: '01',
      //     todoText: 'thức dậy chào ngày mới',
      //     deadline: '06:00',
      //     isDone: true)
      // ToDo(id: '02', todoText: 'ăn sáng', dateline: '06:30', isDone: true),
      // ToDo(
      //   id: '03',
      //   todoText: 'đi học lúc 9h',
      //   dateline: '09:00',
      //   isDone: true,
      // ),
      // ToDo(
      //   id: '04',
      //   todoText: '12h10 ăn trưa',
      //   dateline: '12:10',
      //   isDone: false,
      // ),
      // ToDo(
      //   id: '05',
      //   todoText: 'ngủ 30p trước khi vào học buổi chiều',
      //   dateline: '12:30',
      //   isDone: false,
      // ),
      // ToDo(
      //   id: '06',
      //   todoText: 'vào học ca chiều lúc 1h',
      //   dateline: '13:00',
      //   isDone: false,
      // ),
    ];
  }
}
