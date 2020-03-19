
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
