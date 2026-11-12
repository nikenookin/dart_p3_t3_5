import 'dart:io' as io;

void main() {
  double balance = 0.0;
  bool isRunning = true;

  print('=== Безопасный банк: Трипл Т Сахур ===');

  try {
    while (isRunning) {
      print('Выберите операцию:');
      print('1 — Пополнить');
      print('2 — Снять');
      print('3 — Баланс');
      print('0 — Выход');
      io.stdout.write('Ваш выбор: ');

      String? input = io.stdin.readLineSync()?.trim();

      try {
        int choice = int.parse(input ?? '');

        switch (choice) {
          case 1:
            io.stdout.write('Введите сумму для пополнения: ');
            String? amountStr = io.stdin.readLineSync()?.trim();
            double amount = double.parse(amountStr ?? '');

            if (amount < 0) {
              print('Предупреждение: сумма не может быть отрицательной!\n');
            } else {
              balance += amount;
              print('Успешно! Баланс пополнен на $amount. Текущий баланс вашего Трипл Т банка: $balance\n');
            }
            break;

          case 2:
            io.stdout.write('Введите сумму для снятия с Трипл Т банка: ');
            String? amountStr = io.stdin.readLineSync()?.trim();
            double amount = double.parse(amountStr ?? '');

            if (amount < 0) {
              print('Предупреждение: сумма не может быть отрицательной!\n');
            } else if (amount > balance) {
              print('Предупреждение: недостаточно средств на счете! Ваш баланс на Трипл Т банке: $balance\n');
            } else {
              balance -= amount;
              print('Успешно! Снято: $amount. Текущий баланс на Трипл Т банке: $balance\n');
            }
            break;

          case 3:
            print('Текущий баланс счета на Трипл Т банке: $balance\n');
            break;

          case 0:
            print('Завершение работы банкомата...');
            isRunning = false;
            break;

          default:
            print('Предупреждение: неверный пункт меню. Выберите от 0 до 3.\n');
        }
      } on FormatException {
        print('Предупреждение: введено не число! Пожалуйста, используйте цифры.\n');
      }
    }
  } finally {
    print('Сессия завершена. Данные сессии успешно сохранены.');
  }
}