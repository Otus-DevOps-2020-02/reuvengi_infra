
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
