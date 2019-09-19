@echo off
REM #versao mark-v0.3#
REM #DESCRICAO#
REM #Instalao Zabbix via rede nos servidores Windows#
REM #GERALDO LUCAS POLI (19/09/2018)#
REM # Verifica existencia diretório Zabbix #

REM #MODULO 1#
IF EXIST "c:\Zabbix\zabbix_agentd.exe" (exit) ELSE (echo "Iniciando a instalacao do Zabbix Agent")
REM # Exibe mensagem na tela#
echo Copiando Arquivos

REM #MODULO 2 - CRIAR DIRETORIO NA MAQUINA#
mkdir c:\zabbix
echo Pasta zabbix criada no C:

REM #MODULO 3 - Realiza a cópia dos binários para o sistema#
xcopy \\192.168.2.12\zabbix\zabbix_agents_3.4.6.win\bin\win64\zabbix_agentd.exe c:\zabbix\
xcopy \\192.168.2.12\zabbix\zabbix_agents_3.4.6.win\bin\win64\zabbix_get.exe c:\zabbix\
xcopy \\192.168.2.12\zabbix\zabbix_agents_3.4.6.win\bin\win64\zabbix_sender.exe c:\zabbix\

cd c:\zabbix
Invoke-WebRequest -UseBasicParsing https://raw.githubusercontent.com/geraldolucaspoli/install-zabbix-agente-windows/master/zabbix_agents_3.4.6.win/bin/win64/zabbix_agentd.exe -OutFile zabbix_agentd.exe



REM #MODULO 4 *PUNK* - Cria arquivo de configuração e define nome do servidor #
echo Criando Arquivos de configuracao
echo Server=192.168.1.26 > c:\zabbix\zabbix_agentd.conf
echo Hostname=%COMPUTERNAME% >> c:\zabbix\zabbix_agentd.conf
echo StartAgents=5 >> c:\zabbix\zabbix_agentd.conf
echo DebugLevel=3 >> c:\zabbix\zabbix_agentd.conf
echo LogFile=c:\zabbix\zabbix_agentd.log >> c:\zabbix\zabbix_agentd.conf
echo Timeout=5 >> c:\zabbix\zabbix_agentd.conf
echo EnableRemoteCommands=1 >> C:\zabbix\zabbix_agentd.conf

REM #MODULO 4 - Ajustes Finais #
echo Instalando o Serviço
C:\zabbix\zabbix_agentd.exe -i -c C:\zabbix\zabbix_agentd.conf
C:\zabbix\zabbix_agentd.exe -s -c C:\zabbix\zabbix_agentd.conf
echo As configuracoes para o servidor %COMPUTERNAME% foram criadas em %date% as %time%
echo As configuracoes para o servidor %COMPUTERNAME% foram criadas em %date% as %time% > c:\Zabbix\inst_agent.log
pause

