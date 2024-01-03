@echo off
REM K. Richard, github Auto_Windows_Python_venv_Install, January 2024

set app=hello_world.py
set py_version=Python310
set version=3.10.11
set venv_folder=venv
set language=EN
REM language = FR or EN


REM cmd window header line
echo(
echo ***********************************************************************************************************
if %language%==FR echo *** Installateur Python, createur de l'environnement virtuel (venv) et ouverture de l'interpreteur Idle. ***
if %language%==EN echo *** Python installer, virtual environnement creator (venv) and start Idle interpreter.                  ***
echo ***********************************************************************************************************
echo(
echo Python %version%
echo(
echo(


REM Validate in venv folder exist
if not exist %cd%\%venv_folder% (mkdir %cd%\%venv_folder%) else (GOTO:PythonInstall)
if %language%==FR (echo *** Creation du dossier %cd%\%venv_folder%)
if %language%==EN (*** Creation of directory %cd%\%venv_folder%)

:PythonInstall
echo(
if %language%==FR (echo ### Validation de l'installation Python %version%)
if %language%==EN (echo ### Validating installation of Python %cd%\%venv_folder%)
echo py -0p
py -0p
echo where python
where python
echo(

where python | findstr %py_version% && GOTO:PythonVenv

echo(   
if %language%==FR (echo ***   Python %version% n'est pas present. Le telechargement va debuter.)
if %language%==EN (echo ***   Python %version% is not present. Download will start shortly.)                                                    
echo ***   https://www.python.org/ftp/python/%version%/python-%version%-amd64.exe
echo(
echo(
if %language%==FR (echo Telechargement en cours...)
if %language%==EN (echo Downloading...)
echo(

REM download of python installer .exe
curl --location --request GET https://www.python.org/ftp/python/%version%/python-%version%-amd64.exe --output %cd%\%venv_folder%\python-%version%-amd64.exe 

echo(

if %language%==FR (echo Installation en cours...)
if %language%==EN (echo Installing...)

%cd%\%venv_folder%\python-%version%-amd64.exe /quiet InstallAllUsers=0 PrependPath=1 Include_test=0 AssociateFiles=1 Shortcuts=1

echo Windows Registry Editor Version 5.00 > %cd%\%venv_folder%\LongKeyEnable.reg
echo( >> %cd%\%venv_folder%\LongKeyEnable.reg
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem] >> %cd%\%venv_folder%\LongKeyEnable.reg
echo "LongPathsEnabled"=dword:00000001 >> %cd%\%venv_folder%\LongKeyEnable.reg

echo(

if %language%==FR (echo Veuillez autoriser la modification de la cle de registre LongKeyEnable.)
if %language%==EN (echo Autorise LongKeyEnable register key modification. )

Rem Apply 1 to LongKeyEnable register key
%cd%\%venv_folder%\LongKeyEnable.reg


:PythonVenv
echo(
echo(

if %language%==FR (echo ### Validation de l'environnement virtuel %py_version%)
if %language%==EN (echo ### Validating virtual environnment %py_version%)

if exist %cd%\%venv_folder%\Scripts\ (GOTO:StartIdle) else (GOTO:InitVenv)

:InitVenv
echo(
if %language%==FR (echo *** Creation de l'environnement virtuel %venv_folder% pour Python %version%)
if %language%==EN (echo *** Creating virtual environnment %venv_folder% for Python %version%)

where python | findstr %py_version% > %cd%\%venv_folder%\%py_version%_path.txt || GOTO:eof
set /p OUTPUT=<%cd%\%venv_folder%\%py_version%_path.txt
del %cd%\%venv_folder%\%py_version%_path.txt
%OUTPUT% -m venv %cd%\%venv_folder%

REM 01_venv_cmd.bat file creation
echo start %cd%\%venv_folder%\Scripts\activate.bat > %cd%\%venv_folder%\01_venv_cmd.bat

REM 02_install_requirements.bat file creation
echo %cd%\%venv_folder%\Scripts\pip install -r %cd%\requirements.txt > %cd%\%venv_folder%\02_install_requirements.bat
echo timeout 5 >> %cd%\%venv_folder%\02_install_requirements.bat

REM 03_save_requirements.bat file creation
echo %cd%\%venv_folder%\Scripts\pip freeze ^> %cd%\requirements.txt > %cd%\%venv_folder%\03_save_requirements.bat
echo timeout 5 >> %cd%\%venv_folder%\03_save_requirements.bat

if %app% == Hello_world.py (echo %app% == Hello_world.py Vrai) else (echo %app% == Hello_world.py Faux)
if not %app%== hello_world.py (GOTO:SkipHelloWorld)
REM Hello_world.py file creation
echo( > %cd%\hello_world.py
echo def main(): >> %cd%\hello_world.py
echo     print('Hello World !') >> %cd%\hello_world.py
echo( >> %cd%\hello_world.py
echo if __name__ == '__main__': >> %cd%\hello_world.py
echo     main() >> %cd%\hello_world.py


:SkipHelloWorld
REM main_idle_file.txt file creation
echo %app% > %cd%\%venv_folder%\main_idle_file.txt
                                                  
if %language%==FR (echo *** La creation de l'environnement virtuel venv pour %py_version% est completee)
if %language%==EN (echo *** Virtual environnment venv for %py_version% completed)

if not exist %cd%\requirements.txt (echo( > %cd%\requirements.txt)
if not exist %cd%\requirements.txt (GOTO:StartIdle)
%cd%\%venv_folder%\Scripts\pip install -r %cd%\requirements.txt
timeout 5


:StartIdle
echo(

if %language%==FR (echo ### Ouverture de l'interpreteur Python Idle)
if %language%==EN (echo ### Starting Idle Python interpreter)


set /p main_file=<%cd%\%venv_folder%\main_idle_file.txt

%cd%\%venv_folder%\Scripts\python -m idlelib %main_file%



