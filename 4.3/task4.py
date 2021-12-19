import socket
import time
import json

import yaml


def check_ip(hosts):
    result = {'changed': False}
    for host in hosts.keys():
        out = socket.gethostbyname(host)
        if hosts[host] == out:
            continue
        else:
            result['changed'] = True
            hosts[host] = out
    return result


while True:
    try:
        json_file = './config/services.json'
        yaml_file = './config/services.yaml'
        with open(json_file, 'r') as services_json, open(yaml_file, 'r') as services_yaml:

            print('Загрузка конфигурации')
            try:
                hosts_json = json.load(services_json)
            except json.decoder.JSONDecodeError:
                print('Ошибка синтаксиса в файле: ' + json_file)
                exit()
            hosts_yaml = yaml.load(services_yaml.read(), Loader=yaml.SafeLoader)

            if hosts_yaml is None:
                print('Файл пуст: ' + yaml_file)
                exit()

        print('Проверка ip адресов')
        result_json = check_ip(hosts_json)
        result_yaml = check_ip(hosts_yaml)
        if result_json['changed']:
            with open(json_file, 'w') as json_:
                print('IP-адреса поменялись, сохраняю')
                json_.write(json.dumps(hosts_json, indent=4))

        if result_yaml['changed']:
            with open(yaml_file, 'w') as yaml_:
                print('IP-адреса поменялись, сохраняю')
                yaml_.write(yaml.dump(hosts_yaml, indent=4))
        print('Завершено')
    except FileNotFoundError:
        print('Нет файлов конфигурации')
        exit()
    time.sleep(5)
