# Домашнее задание к занятию "6.1. Типы и структура СУБД"

## Введение

Перед выполнением задания вы можете ознакомиться с 
[дополнительными материалами](https://github.com/netology-code/virt-homeworks/tree/master/additional/README.md).

## Задача 1

Архитектор ПО решил проконсультироваться у вас, какой тип БД 
лучше выбрать для хранения определенных данных.

Он вам предоставил следующие типы сущностей, которые нужно будет хранить в БД:

- Электронные чеки в json виде
> Документо-ориентированные  
> для чеков думаю данный тип наиболее подходящий
- Склады и автомобильные дороги для логистической компании
> Ключ-значение   
> т.к. данный тип использует ключ-значение. В ключ можно отнести например номер склада, дороги, а значение - описание либо адрес
- Генеалогические деревья
> Графовые  
> Данные храняться в виде узлов, ребер и свойств, что отвечает требованиям хренения в БД генеалогических деревьев
- Кэш идентификаторов клиентов с ограниченным временем жизни для движка аутенфикации
> NoSQL
> не ртебуется структурирование данных. Возможно использование NoSQL
- Отношения клиент-покупка для интернет-магазина
> Column-oriented  
> В таких системах данные хранятся в
виде матрицы, строки и столбцы которой
используются как ключи.  Не требуется соглавованность данных

Выберите подходящие типы СУБД для каждой сущности и объясните свой выбор.

## Задача 2

Вы создали распределенное высоконагруженное приложение и хотите классифицировать его согласно 
CAP-теореме. Какой классификации по CAP-теореме соответствует ваша система, если 
(каждый пункт - это отдельная реализация вашей системы и для каждого пункта надо привести классификацию):

- Данные записываются на все узлы с задержкой до часа (асинхронная запись)
>По CAP теореме - AP, т.к. асинхронная запись не может дать гарантию консистентности данных. 
> По PACELC теореме вероятно PA/EL, т.к.  задержки в один час скорей всего будет достаточно чтобы устранить небольшие сетевые проблемы.
- При сетевых сбоях, система может разделиться на 2 раздельных кластера

>По CAP теореме - AP, т.к. если система функционирует, разделённая на 2 части, она так же не может быть консистентной
>Это PA/EC-система. Каждый кластер будет доступен и будет отвечать на запросы. 
> Но из-за разделения может произойти рассогласованность данных.
- Система может не прислать корректный ответ или сбросить соединение
>По CAP теореме - CP, т.к. условие доступности требует, чтобы запрос всегда завершался корректным ответом. 
> По PACELC теореме  PC/EC, судя по описанию доступность не так важна, остаётся согласованность.

А согласно PACELC-теореме, как бы вы классифицировали данные реализации?

## Задача 3

Могут ли в одной системе сочетаться принципы BASE и ACID? Почему?
> Нет  
> BASE - принцип, противопоставляющий себя ACID. ACID - требования к СУБД, в обеспечение надежности и предсказуемости
ее работы, BASE позволяет проектировать высокопроизводительные системы.
## Задача 4

Вам дали задачу написать системное решение, основой которого бы послужили:

- фиксация некоторых значений с временем жизни
- реакция на истечение таймаута

Вы слышали о key-value хранилище, которое имеет механизм [Pub/Sub](https://habr.com/ru/post/278237/). 
Что это за система? Какие минусы выбора данной системы?

```
Пример использования: 
Корзина интернет магазина
Во время праздничного сезона покупок сайт интернет‑магазина может получать миллиарды заказов за считаные секунды. Используя базы данных на основе пар «ключ‑значение», можно обеспечить необходимое масштабирование при существенном увеличении объемов данных и чрезвычайно интенсивных изменениях состояния. Такие базы данных позволяют одновременно 
обслуживать миллионы пользователей благодаря распределенным обработке и хранению данных. 
```
```
Хранилище «ключ-значение» или база данных «ключ-значение» — это простая база данных, использующая ассоциативный массив (подумайте о карте или словаре) в качестве фундаментальной модели данных,
где каждый ключ связан с одним и только одним значением в коллекции. Эта связь называется парой ключ-значение.
Такие хранилища хороши в плане доступности (Availability) и устойчивости к разделению (Partition tolerance), но явно проигрывают в согласованности данных (Consistency).  
Минусы:
- модель не предоставляет стандартные возможности баз данных вроде атомарности транзакций или согласованности данных при одновременном выполнении нескольких транзакций
- при увеличении объёмов данных, поддержание уникальных ключей может стать проблемой. Для её решения необходимо как-то усложнять процесс генерации строк, чтобы они оставались уникальными среди очень большого набора ключей.
```
---

### Как cдавать задание

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---