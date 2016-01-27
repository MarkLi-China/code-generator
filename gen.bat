@echo off
SetLocal EnableDelayedExpansion
echo �����������ļ�ѡ�
set/p env=>nul
echo ����ѡ�%env%
cd %~dp0

SET CLASSPATH=.
FOR %%i IN ("./lib/*.jar") DO SET CLASSPATH=!CLASSPATH!;lib\%%i

call mvn clean compile
rem mkdir target
set OPTS=-cp ./target/classes;%CLASSPATH% codegen.CodeGenerator conf/genConfig-%env%.xml
java %OPTS% 2
rem echo mybatisGenCfg gen done
call mvn mybatis-generator:generate
java %OPTS%
rem echo Done
EndLocal
pause