# ДЗ 5.2

## 1. 
> Опишите своими словами основные преимущества применения на практике IaaC паттернов.

- Удобно масштабировать
- Удобно вносить изменения - централизованно, используя git
- Доступна история изменений, можно откатиться назад в случае проблем
- Если нужно что-то узнать о причинах или принятых решениях в конфигурации - известно кто за этим стоит
- Копии конфигураций серверов всегда доступны во внешнем хранилище, если что-то случиться с сервером - резервная копия есть 

> Какой из принципов IaaC является основополагающим?

**Идемпотентность:** возможность описать желаемое состояние того, что конфигурируется, с определённой гарантией что оно будет достигнуто.

## 2.
> Чем Ansible выгодно отличается от других систем управление конфигурациями?

- Если не удалось доставить конфигурацию на сервер, он оповестит об этом.
- Более простой синтаксис, чем у конкурентов
- Работает без агента на клиентах, использует ssh для доступа на клиент

> Какой, на ваш взгляд, метод работы систем конфигурации более надёжный push или pull?

Push надёжней, т.к. централизованно управляет конфигурацией и исключает ситуации, когда кто-то что-то исправил напрямую на сервере и не отразил в репозитории - это может потеряться или создавать непредсказуемые ситуации.
## 3.
> Установить на личный компьютер:
> 
> - VirtualBox
> - Vagrant
> - Ansible
> 
> *Приложить вывод команд установленных версий каждой из программ, оформленный в markdown.*

* Vagrant

      PS C:\Users\sergey> vagrant --version
      Vagrant 2.2.18

* Varantfile

      # -*- mode: ruby -*-
      # vi: set ft=ruby :
      
      Vagrant.configure("2") do |config|
          config.vm.box = "bento/ubuntu-20.04"
          config.vm.provider "hyperv"
          
          config.vm.network "public_network", bridge: "Default Switch"
          config.vm.synced_folder ".", "/vagrant", disabled: true
      
          config.vm.provider "hyperv" do |h|
              h.vm_integration_services = { 
                guest_service_interface: true
              }
          end
      
          config.vm.provision "shell", inline: <<-SHELL
            apt-get update
            apt-get install -y ansible
          SHELL
        end
               
* Ubuntu

      vagrant@ubuntu-20:~$ dmesg | grep 'Hypervisor detected'
      [    0.000000] Hypervisor detected: Microsoft Hyper-V

* Ansible

      vagrant@ubuntu-20:~$ ansible --version
      ansible 2.9.6
        config file = /etc/ansible/ansible.cfg
        configured module search path = ['/home/vagrant/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
        ansible python module location = /usr/lib/python3/dist-packages/ansible
        executable location = /usr/bin/ansible
        python version = 3.8.2 (default, May 13 2020, 19:53:34) [GCC 9.3.0]
