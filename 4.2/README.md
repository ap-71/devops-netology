# ДЗ 4.2

## 1. Есть скрипт...
### Решение:
#### Какое значение будет присвоено переменной c?

Будет вызвано исключение, "ошибка типа", так как невозможно сложить стоку с целочисленным значением
```
TypeError: unsupported operand type(s) for +: 'int' and 'str'
```

#### Как получить для переменной c значение 12?
```
c = str(a) + b
```
#### Как получить для переменной c значение 3?
```
c = a + int(b)
```

## 2. Мы устроились на работу в компанию, где раньше уже был...

необходимо удалить ``` break ```, так как при его наличии при первом же совпадении прекращается выполнение цикла ```for ...```

[Исправленный код](task2.py "Исправленный код")

## 3. Доработать скрипт выше так, чтобы он мог проверять не только локальный репозиторий...
Скрипт доработан

[Доработанный код](task3.py "Доработанный код")

## 4. Наша команда разрабатывает несколько веб-сервисов...
Написан скрипт, который опрашивает веб-сервисы, получает их IP...

[Реализованный скрипт](task4.py "Скрипт проверки IP веб-сервисов")