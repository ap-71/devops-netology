import os
import socket
import time

hosts = {host: {'current_ip': '', 'old_ip': ''} for host in ['drive.google.com', 'mail.google.com', 'google.com']}

while True:
    for host in hosts.keys():
        out = socket.gethostbyname(host)
        check_ok = f'<{host}> - <{out}>'
        check_error = f'[ERROR] <{host}> IP mismatch: <{hosts[host]["old_ip"]}> <{hosts[host]["current_ip"]}>'
        if hosts[host]['current_ip'] == out:
            print(check_ok)
            continue
        if hosts[host]['current_ip'] == '':
            hosts[host]['current_ip'] = out
            print(check_ok)
        else:
            hosts[host]['old_ip'] = hosts[host]['current_ip']
            hosts[host]['current_ip'] = out
            print(check_error)
    time.sleep(5)
