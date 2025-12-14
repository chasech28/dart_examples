import 'package:flutter_test/flutter_test.dart';

void main() {
  group('map', () {
    test('base', () {
      var map = {'name': '张三', 'age': 18, 'sex': '男'};
      expect('${map['name']}', '张三');
      expect('${map['age']}', '18');
      expect('${map['sex']}', '男');

      map.forEach((key, value)  {
        print('key: $key, value: $value');
      });

      expect(map.length, 3);
      expect(map.isEmpty, false);
      expect(map.isNotEmpty, true);
      expect(map.containsKey('name'), true);
      expect(map.containsValue('张三'), true);

    });
  });
}
