![alt text](https://techpoli.info/wp-content/uploads/2019/03/zabbix_logo_500x131.png)

# Informações
Scripts para facilitar a instalação do Zabbix Agente no Windows.
Lembrando que alguns parametros devem ser alterados para rodar na sua estrutura.

Alterar no Modulo 3 aonde está os arquivos binários para o sistema:

REM #MODULO 3
xcopy \\192.168.2.12\zabbix\zabbix_agents-4.0.0-win\bin\win64\zabbix_agentd.exe c:\zabbix\
xcopy \\192.168.2.12\zabbix\zabbix_agents-4.0.0-win\bin\win64\zabbix_get.exe c:\zabbix\
xcopy \\192.168.2.12\zabbix\zabbix_agents-4.0.0-win\bin\win64\zabbix_sender.exe c:\zabbix\

Alterar no Modulo 4 o IP do servidor Zabbix :

echo Server=192.168.1.26 > c:\zabbix\zabbix_agentd.conf

Apos essas alterações só propagar esse executavel para todas estações da sua rede.
