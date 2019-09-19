#versao mark-v0.3#
#Instalao Zabbix via rede nos servidores Windows#
#GERALDO LUCAS POLI (19/09/2018)#

#MODULO 2 - CRIAR DIRETORIO NA MAQUINA#
mkdir c:\zabbix
echo Pasta zabbix criada no C:

#MODULO 3 - Realiza a cópia dos binários para o sistema#
cd c:\zabbix
Invoke-WebRequest -UseBasicParsing https://raw.githubusercontent.com/geraldolucaspoli/install-zabbix-agente-windows/master/zabbix_agents_3.4.6.win/bin/win64/zabbix_agentd.exe  -OutFile zabbix_agentd.exe
Invoke-WebRequest -UseBasicParsing https://raw.githubusercontent.com/geraldolucaspoli/install-zabbix-agente-windows/master/zabbix_agents_3.4.6.win/bin/win64/zabbix_get.exe	    -OutFile zabbix_get.exe
Invoke-WebRequest -UseBasicParsing https://raw.githubusercontent.com/geraldolucaspoli/install-zabbix-agente-windows/master/zabbix_agents_3.4.6.win/bin/win64/zabbix_sender.exe  -OutFile zabbix_sender.exe
Invoke-WebRequest -UseBasicParsing https://raw.githubusercontent.com/geraldolucaspoli/install-zabbix-agente-windows/master/zabbix_agentd.conf                                   -OutFile zabbix_agentd.conf

#MODULO 4 - Cria arquivo de configuração e define nome do servidor #
$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'
echo Hostname=$env:COMPUTERNAME.redeunifique.com.br >> c:\zabbix\zabbix_agentd.conf

#MODULO 4 - Ajustes Finais #
C:\zabbix\zabbix_agentd.exe -i -c C:\zabbix\zabbix_agentd.conf
start-service "Zabbix Agent"