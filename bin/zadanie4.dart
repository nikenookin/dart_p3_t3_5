import 'dart:io' as io;

void main() {
  print('=== Компактный калькулятор (для выхода: exit) ===');

  while (true) {
    double? n1 = _ask('Число 1:');
    if (n1 == null) break;

    io.stdout.write('Оператор (+, -, *, /): ');
    String? op = io.stdin.readLineSync()?.trim();
    if (op == 'exit') break;

    double? n2 = _ask('Число 2:');
    if (n2 == null) break;

    try {
      double res = switch (op) {
        '+' => n1 + n2,
        '-' => n1 - n2,
        '*' => n1 * n2,
        '/' => n2 == 0 ? throw 'Деление на ноль!' : n1 / n2,
        _ => throw 'Неверный оператор',
      };
      print('Результат: $n1 $op $n2 = $res\n');
    } catch (e) {
      print('Ошибка: $e\n');
    }
  }
}

double? _ask(String prompt) {
  while (true) {
    io.stdout.write('$prompt ');
    String? s = io.stdin.readLineSync()?.trim();
    if (s == 'exit') return null;
    double? v = double.tryParse(s ?? '');
    if (v != null) return v;
    print('Ошибка: введите число!');
  }
}