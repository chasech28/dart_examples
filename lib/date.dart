void main() {
  DateTime now = DateTime.now();

  // 格式化为 "yyyy-MM-dd HH:mm:ss"
  String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
  print(formattedDate); // 示例输出: 2023-11-15 14:30:45
}
