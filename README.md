
## ДЗ

1. Подключение к <span style="color:red">someinternalhost</span> в одну команду

    ```bash
    ssh -i ~/.ssh/appuser -J 146.148.23.110 10.132.0.3
    ```
2. Подключение из консоли вида <span style="color:red">ssh someinternalhost</span>
    ```bash
    touch ~/.ssh/config
    chmod 600 ~/.ssh/config
    ```
    содержимое файла ~/.ssh/config
    ```bash
    Host bastion
      Hostname 146.148.23.110
      User appuser
      IdentityFile  ~/.ssh/appuser
    Host someinternalhost
      HostName 10.132.0.3
      ProxyJump appuser@bastion
      User appuser
    ```

3. Был поднят vpn сервер на bastion, адрес панели управления https://146.148.23.110.getmoss.site/ - с сретификатом letsencrypt

```
bastion_IP = 146.148.23.110
someinternalhost_IP = 10.132.0.3
```

## ДЗ 6

1. Были созданы скрипты

```
  install_mongodb.sh
  install_ruby.sh
  deploy.sh
```

2. Эти скрипты были объеденены в  startup-script.sh

3. Команда gcloud  со startup-script

```bash

gcloud compute instances create reddit-app --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure  --metadata-from-file startup-script=startup-script.sh

```

4. Создание правила firewall через gcloud

gcloud compute --project=inbound-summit-260319 firewall-rules create default-puma-server --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:9292 --source-ranges=0.0.0.0/0 --target-tags=puma-server

### Данные для подключение

testapp_IP = 35.241.173.135
testapp_port = 9292


## ДЗ 7

1. Был создан шаблон образа ubuntu16.json и проверен делой образа

2. Шаблон был параметрезирован, создан файл variables.json и занесен в .gitignore

3. Был создан файл variables.json.example с расширенными переменными

4. Создан шаблон immutable.json, который деплоит приложение в виде сервиса

5. Создан скрипт запуска виртуальной машины с образом reddit-full


## ДЗ 8 Знакомство с terraform

1. Определена input переменная для приватного ключа,
использующегося в определении подключения для
провижинеров (connection);
2. Определена input переменную для задания зоны в ресурсе
"google_compute_instance" "app". У нее есть значение по умолчанию.
3. Отформатироны все конфигурационные файлы используя
команду terraform fmt;
4. Создан  файл terraform.tfvars.example, в
котором  указаны переменные для образца.


### Задание со *

1. Описано в коде терраформа добавление ssh ключа пользователя
appuser1 в метаданные проекта.

2. Описано в коде терраформа добавление ssh ключей нескольких
пользователей в метаданные проекта

3. Добавлен в веб интерфейсе ssh ключ пользователю appuser_web
в метаданные проекта. Выполните terraform apply и проверьте
результат - ключи, которые были, они перезаписались



## ДЗ 9 Принципы организации инфраструктурного кода и работа над инфраструктурой в команде на примере Terraform

1. Проверьте работу параметризованного в прошлом слайде
модуля vpc.
2. Введите в source_ranges не ваш IP адрес, примените правило и
проверьте отсутствие соединения к обоим хостам по ssh.
Проконтролируйте, как изменилось правило файрвола в веб
консоли.
3. Введите в source_ranges ваш IP адрес, примените правило и
проверьте наличие соединения к обоим хостам по ssh.
4. Верните 0.0.0.0/0 в source_ranges.

5. Удалите из папки terraform файлы main.tf, outputs.tf,
terraform.tfvars, variables.tf, так как они теперь перенесены
в stage и prod
6. Параметризируйте конфигурацию модулей насколько считаете
нужным
7. Отформатируйте конфигурационные файлы, используя команду
terraform fmt

### Задание со *

1. Настройте хранение стейт файла в удаленном бекенде (remote
backends) для окружений stage и prod, используя Google Cloud
Storage в качестве бекенда. Описание бекенда нужно вынести в
отдельный файл backend.tf
2. Перенесите конфигурационные файлы Terraform в другую
директорию (вне репозитория). Проверьте, что state-файл
(terraform.tfstate) отсутствует. Запустите Terraform в обеих
директориях и проконтролируйте, что он "видит" текущее
состояние независимо от директории, в которой запускается
3. Попробуйте запустить применение конфигурации одновременно,
чтобы проверить работу блокировок
4. Добавьте описание в README.md

## ДЗ 10 Управление конфигурацией. Знакомство с Ansible

1. Был создан playbook clone.yaml - после удаление директориии и при повторном накате, значение changed было измненено на true

### Задание со *

был создан файл inventory.py, который генерирует инвентори в форма json
