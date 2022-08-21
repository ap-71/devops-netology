Объявляем имя плэйбука и указываем хосты
```yaml
- name: Install Clickhouse
  hosts: clickhouse
  # debugger: always
  # debugger: never
  # debugger: on_failed
```
объявляем обработчик для перезапуска службы Clickhouse
```yaml
  handlers:
    - name: Start clickhouse service
      become: true
      ansible.builtin.service:
        name: clickhouse-server
        state: restarted
```
Скачивание дистрибутивов
```yaml
 tasks:
    - block:
        - name: Get clickhouse distrib
          ansible.builtin.get_url:
            url: "https://packages.clickhouse.com/rpm/stable/{{ item }}-{{ clickhouse_version }}.noarch.rpm"
            dest: "./{{ item }}-{{ clickhouse_version }}.rpm"
          with_items: "{{ clickhouse_packages }}"
          check_mode: false # отключаем проверку таски
      rescue:
        - name: Get clickhouse distrib
          ansible.builtin.get_url:
            url: "https://packages.clickhouse.com/rpm/stable/clickhouse-common-static-{{ clickhouse_version }}.x86_64.rpm"
            dest: "./clickhouse-common-static-{{ clickhouse_version }}.rpm"
```
Установка Clickhouse
```yaml
    - name: Install clickhouse packages
      become: true
      ansible.builtin.yum:
        name:
          - clickhouse-common-static-{{ clickhouse_version }}.rpm
          - clickhouse-client-{{ clickhouse_version }}.rpm
          - clickhouse-server-{{ clickhouse_version }}.rpm
```
Вызов обработчика перезапуска службы
```yaml
     notify: Start clickhouse service
```
Создание базы данных 
```yaml
    - name: Create database
      ansible.builtin.command: "clickhouse-client -q 'create database logs;'"
      register: create_db
      failed_when: create_db.rc != 0 and create_db.rc !=82
      changed_when: create_db.rc == 0

```
Объявление плэйбука установки Vector
```yaml
- name: Install Vector
  hosts: clickhouse
```
объявляем обработчик для перезапуска службы Vector
```yaml
- name: Install Vector
  hosts: clickhouse
  handlers:
   - name: Start Vector service
     become: true
     ansible.builtin.service:
       name: vector
       state: restarted
```
Скачивание дистрибутивов
```yaml
 tasks:
    - name: Get vector distrib
      ansible.builtin.get_url:
        url: "https://packages.timber.io/vector/0.20.0/vector-0.20.0-1.x86_64.rpm"
        dest: "./vector-0.20.0-1.x86_64.rpm"
```
Установка Vector 
```yaml
 - name: Install vector packages
      become: true
      ansible.builtin.yum:
        name:
          - vector-0.20.0-1.x86_64.rpm
```
Вызов обработчика перезапуска службы
```yaml
 notify: Start Vector service
```
 




