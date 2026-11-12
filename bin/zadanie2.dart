import 'dart:io';

void main() {
  stdout.write('Введите ваш возраст: ');
  
  String? input = stdin.readLineSync();

  try {
    int age = int.parse(input!);
    print('Успешно! Ваш возраст: $age');
  } catch (e) {
    print('Ошибка: введено не число');
  } finally {
    print('Проверка ввода завершено');
  }
}