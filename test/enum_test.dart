import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Transform enum', () {
    test('int to enum', () {
      expect(Color.red, ColorMapper.fromInt(0));
      expect(Color.green, ColorMapper.fromInt(1));
      expect(Color.blue, ColorMapper.fromInt(2));
    });

    test('enum to int', () {
      expect(Color.red.value, 0);
      expect(Color.green.value, 1);
      expect(Color.blue.value, 2);
    });
  });
}

enum Color { red, green, blue }

extension ColorMapper on Color {
  int get value => index;

  static Color fromInt(int value) {
    switch (value) {
      case 0:
        return Color.red;
      case 1:
        return Color.green;
      case 2:
        return Color.blue;
      default:
        throw ArgumentError('Invalid value');
    }
  }
}
