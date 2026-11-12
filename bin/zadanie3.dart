void main() {
  safeDivide(10, 2);
  safeDivide(10, 0);
}

void safeDivide(int a, int b) {
  try {
    if (b == 0) {
      throw Exception('Деление на ноль запрещено');
    }
    
    double result = a / b;
    print('Результат деления $a на $b = $result');
  } catch (e) {
    print('Перехвачено исключение: \n$e');
  }
}