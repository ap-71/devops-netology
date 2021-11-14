# ДЗ 3.2

1 
```
cd - Это встроенная команда Bash и меняет текущую папку только для оболочки, в которой выполняется.
```
2
```
grep -c <some_string> <some_file>
```
3
```
PID 1 == systemd(1)
```
4
```
ls 2> /dev/pts/2  - pts/2 = номер другой сессии терминала 
```
5
```
cat file1.txt | grep "hello" > file2.txt
```
6 Вывести получится:
```
vagrant@vagrant:/tmp$ tty
/dev/pts/1

vagrant@vagrant:/tmp$ sudo echo netology > /dev/tty1
-bash: /dev/tty1: Permission denied
vagrant@vagrant:/tmp$ echo netology > sudo /dev/tty1
```
чтобы увидеть вывод, нужно перейти в TTY горячими клавишами

7
```
bash 5>&1 - Создаст дескриптор 5, перенаправит в stdout
echo netology > /proc/$$/fd/5 - выведет в дескриптор 5, который был пернеаправлен в stdout
```
8
```
/dev/tty1 6>&2 2>&1 1>&6 | grep 'Permission denied'
```
9 Выведет переменное окружение. Аналоги:
```
env, printenv
```
10
```
/proc/<PID>/cmdline - полный путь до исполняемого файла процесса PID
/proc/<PID>/exe - содержит ссылку до файла запущенного для процесса PID. Cat выведет содержимое запущенного файла, запуск этого файла, запустит еще одну копию самого файла
```
11
```
grep sse /proc/cpuinfo  

sse4_2
```
12 при выполнении команды проблем не возникает
```
ssh localhost 'tty'
vagrant@localhost's password:
Permission denied, please try again.
vagrant@localhost's password:
Permission denied, please try again.
vagrant@localhost's password:
vagrant@localhost: Permission denied (publickey,password).
```
13 Попробовал перенести запущенный процесс из одной сессии в другую - получилось, но только после редактирования файла:
```
/etc/sysctl.d/10-ptrace.conf
```
14 Команда tee в Linux нужна для записи вывода любой команды в один или несколько файлов.
```
sudo tee - будет работать, потому что будет иметь права на запись в файл
```