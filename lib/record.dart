void main() {
  // 1. 基本 Record 使用
  var coordinates = (10.5, 20.3);
  print('X: ${coordinates.$1}, Y: ${coordinates.$2}');

  // 2. 命名 Record
  var person = (name: "Bob", age: 25, isStudent: true);
  print(
    '${person.name} is ${person.age} years old and is ${person.isStudent ? "a student" : "not a student"}',
  );

  var vocabulary = (word: "example", translation: "例子");
  print('The word "${vocabulary.word}" means "${vocabulary.translation}".');
}
