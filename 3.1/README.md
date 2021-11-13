# ДЗ 3.1

1-4 - выполненный деоходимые действия - получилось запустить ВМ, а так же выключить в сохраненном состоянии и в штатном режиме используя команды: "vagrant suspend" и "vagrant halt"

5 - выделенные ресурсы по умолчанию:
5.1 RAM - 1 гб
5.2 CPU - 2 шт
5.3 HDD - виртуальный размер 64 гб
5.4 VRAM - 4 мб
5.5 Сетевая карта - 1 шт, режим работы NAT
5.6 COM-port - COM-1

6 - Для добавления RAM и CPU:
	config.memory = 1024
	config.cpus = 2

7 - попрактиковался в выполнении команд в ВМ после подключения используя команду "vagrant ssh"

8 - ознакомился с раздела man bash
8.1 export HISTSIZE="SIZE" - Manual page bash(1) line 2403/4548 52%
8.2 ignoreboth = ignoredups и ignorespace
	ignoredups - отключить вывод одинаковых команд
	ignorespace - игнорировать команды, начинающиеся с пробела

9 - {} = группировка команд -  Manual page bash(1) line 213

10 - touch file{0..100000}
	touch file{0..200000} - выдается ошибка, связано с ограничениями по умолчанию, но их можно изменить командой ulimit -s SIZE

11 - [[ -d /tmp ]] - True, если /tmp существует и является каталогом

12 - vagrant@vagrant:~$ mkdir /tmp/new_path_directory
	vagrant@vagrant:~$ cd /tmp/new_path_directory
	vagrant@vagrant:/tmp/new_path_directory$ cp /bin/bash bash
	vagrant@vagrant:/tmp/new_path_directory$ ls
	bash
	vagrant@vagrant:/tmp/new_path_directory$ export PATH=$PATH:/tmp/new_path_directory
	vagrant@vagrant:/tmp/new_path_directory$ type -a bash
	bash is /usr/bin/bash
	bash is /bin/bash
	bash is /tmp/new_path_directory/bash	
	vagrant@vagrant:/tmp/new_path_directory$
13 - at - выполняет команды в указанное время.
	batch  - выполняет команды, когда позволяют уровни загрузки системы; другими словами, когда среднее значение нагрузки падает ниже 1,5 или значения, указанного при вызове atd.

14 - завершил работу ВМ
