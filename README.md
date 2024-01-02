# Auto_Windows_Python_venv_Install

## Intended Usage

Installation of a version of python on a Windows computer, creation of the virtual environnement (venv) and Idle interpreter execution, this from a .bat file.

The intent is to allow people without programming experience or python experience or python interest or computer experience 
to install and use custom python programs on Windows with the Idle interpreter without almost no tutorials or packages version management.


## How to use            

1- Copy the Idle_3_XX.bat in the directory of your python project

2- (optional) : Add your python files in the same directory as Idle_3_XX.bat

3- (optional) : Add a requirements.txt file in the same directory as Idle_3_XX.bat

4- (optional) : Configure the Idle_3_XX.bat file (See below)

5- Execute the Idle_3_XX.bat file and accept registry key modification if needed. (Clic or double clic)

6- Press F5 or select Run/Run Module in Idle menu to execute the python app with Idle.

Bonus : -Use 01_venv_cmd.bat to install packages in the environnement. (Ex: pip install numpy)
        -Use 02_install_requirements.bat to install python packages from requirements.txt.
        -Use 03_save_requirements.bat to overwrite requirements.txt with the python packages installed in the environnement.
        -Useless examples available at the end of this file.
      

##  How to configure the .bat file (Idle_3_10.bat or Idle_3_XX.bat.)                     

1- Open the Idle_3_XX.bat for edition. (Right clic -> edit)

2- Configure the variables at the beginning of the Idle_3_XX.bat file.
      ```
      set app=hello_world.py      --> The filename of the python app, in the same folder as Idle_3_XX.bat, that needs to be open with Idle. 
                                      Modification is also possible in the file main_idle_file.txt after installation.
      set py_version=Python310    --> Python installation folder string. Normally Python3 + Version. In Windows cmd, use "where python" to validate.
      set version=3.10.11         --> Python version to be installed if py_version do not exist.
      set venv_folder=venv        --> Name of the virtual environnement folder created with <path_to_python.exe> -m venv <folder_name>. (Example: venv or venv_3.XX)
      set language=FR             --> FR for French et EN pour English
      ```
      
3- Save the changes.

4- (optional) : Add a requirements.txt file in the same folder as Idle_3_XX.bat to install dependencies when executed.



## How the .bat file works           

1- Create the virtual environnement directory if it do not exist.

2- Download and install specified python version if necessary.

3- Create the virtual environnement with command <path_to_python.exe> -m venv <path_to_venv_folder> if necessary.

4- Create file LongKeyEnable.reg in the environnement directory to modify registry key with virtual environnement creation. (max path length) 

5- Create file 01_venv_cmd.bat in the environnement directory. (Open a cmd window used to install individual packages with virtual environnement creation. Example: "pip install numpy")

6- Create file 02_install_requirements.bat in the environnement directory with virtual environnement creation. (Install python packages from requirements.txt)

7- Create file 03_save_requirements.bat in the environnement directory with virtual environnement creation. (Overwrite requirements.txt with the packages installed in the environnement)

8- Create file hello_world.py with virtual environnement creation. (Used as a python app example)

9- Create file main_idle_file.txt in the environnement directory with virtual environnement creation. (Contains the python app to be open by Idle)

10- Create file requirements.txt with virtual environnement creation if necessary. (Used for packages installation)

11- Start Idle interpreter with the python app specified in main_idle_file.txt.



##  Useless examples      


### Scenario 1: 

I want to start a new python 3.12 project with a venv virtual environnement.

1- I create my project directory named "MyProject".
2- In the main project folder, I download Idle_3_10.bat and rename it Idle_3_12.bat.
3- I configure the Idle_3_12.bat file like this:
        ```
      set app=hello_world.py
      set py_version=Python312    
      set version=3.12.1        
      set venv_folder=venv 
      ```
4- I execute the Idle_3_12.bat and close Idle. Now the project look like this.
        ```
      ├── MyProject
          ├── venv
          |   ├── Include
          |   ├── Lib
          |   ├── Scripts
          |   ├── 01_venv_cmd.bat
          |   ├── 02_install_requirements.bat
          |   ├── 03_save_requirements.bat
          |   ├── main_idle_file.txt
          |   └── pyvenv.cfg
          ├── Idle_3_12.bat
          ├── hello_world.py
          └── requirements.txt
          ```
  5- I rename hello_world.py -> app.py
  6- I modify the file main_idle_file.txt and replace hello_world.py -> app.py
  7- I execute 01_venv_cmd.bat. In the resulting cmd prompt, I install the package numpy I need to the virtual environnement with the command "pip install numpy" then close it.
  8- Every time I install a new package, I execute 03_save_requirements.bat.
  9- When the project is ready to share, I delete the directory "venv" and I configure the Idle_3_12.bat file like this:
  ```
  set app=app.py
  ```
  10- The final version of the project that will be zipped looks like this:
          ```
          ├── MyProject              <br />
              ├── Idle_3_12.bat      <br />
              ├── app.py             <br />
              └── requirements.txt   <br />
              ```

### Scenario 2: 

My grandfather, who as never used internet or python, want to be able to see the date and time with Python 3.7.

1- I create my project directory named "DoobleClic_to_open_PythonProgram_Date"
2- In the main project folder I download Idle_3_10.bat and rename it Idle_37_DoobleClic_then_F5_for_Date.bat.
3- I configure the Idle_37_DoobleClic_then_F5_for_Date.bat file like this:
        ```
        set app=print_date_v1.py
        set py_version=Python37    
        set version=3.7.8        
        set venv_folder=venv
        ```
4- In the project directory, I add the python program named print_date_v1.py that contain 2 lines of code.
      Import datetime
      print(datetime.datetime.now().strftime("%Y%m%d_%H%M%S"))
5- I execute the Idle_37_DoobleClic_then_F5_for_Date.bat and close Idle. Now the project look like this.
      ```
      ├── DoobleClic_to_open_PythonProgram_Date             <br />
          ├── venv                                          <br />
          |   ├── Include                                   <br />
          |   ├── Lib                                       <br />
          |   ├── Scripts                                   <br />
          |   ├── 01_venv_cmd.bat                           <br />
          |   ├── 02_install_requirements.bat               <br />
          |   ├── 03_save_requirements.bat                  <br />
          |   ├── main_idle_file.txt                        <br />
          |   └── pyvenv.cfg                                <br />
          ├── Idle_37_DoobleClic_then_F5_for_Date.bat       <br />
          ├── print_date_v1.py                              <br />
          └── requirements.txt                              <br />
        ```
6- Since I really want the numpy module to be available just in case, I execute 01_venv_cmd.bat. In the resulting cmd prompt, 
   I install the numpy package to the virtual environnement with the command "pip install numpy" then close it.
7- To apply the newly installed package numpy to the requirements.txt file, I execute 03_save_requirements.bat.
   The requirements.txt file now contain the line "numpy==1.26.2".
8- I prepare the delivery version of the project by deleting the directory "venv". Now the project look like this.
        ```
          ├── DoobleClic_to_open_PythonProgram_Date
              ├── Idle_37_DoobleClic_then_F5_for_Date.bat
              ├── print_date_v1.py
              └── requirements.txt
        ```
9- The first time my grangfather execute Idle_37_DoobleClic_then_F5_for_Date.bat, python3.7 will be installed with 
   the virtual environnement and the required packages before opening Idle. After that, only Idle will open.
   
