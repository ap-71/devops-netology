import os
import sys

try:
    bash_command = [f'cd {sys.argv[1]}']
except IndexError:
    bash_command = ["cd ~/netology/sysadm-homeworks"]

bash_command += ["git status"]
result_os = os.popen(' && '.join(bash_command)).read()

list_ = ["modified", "renamed", "untracked"]

for result in result_os.split('\n'):
    for l_ in list_:
        if result.find(l_) != -1:
            print(result.replace('\t', ''))
