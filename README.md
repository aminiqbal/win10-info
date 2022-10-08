# Win10 Info

Useful tips to make the best out of Windows 10 and perhaps later versions.

## General

* In case any of us were unaware:
  * We can quickly run _some_ programs by holding the ```Windows Button``` and then pressing the ```R``` key and then letting go.
    * This will bring up an input dialog called ```Run``` and we could type _certain_ things in the input field to run associated programs.
    * Common inputs most of us would be using:
      * ```notepad```: Launches and instance of the good old Windows Notepad.
      * ```mspaint```: Launches an instance of Microsoft Paint.
      * ```cmd```: Brings up a Command Prompt window where we can execute various commands to get jobs done.
      * ```powershell```: Brings up a Powershell window, essentially an advanced version of the Command Prompt. 
      * ```control panel```: Brings up the Control Panel.
    * We are able to launch the programs from 'Run' in ```Administrative``` mode, a mode where we have more freedom to perform rather risky tasks. Think of it like a security clearance. We do this by holding down the ```Control``` and ```Shift``` keys and pressing ```Enter```.
    * If we want to refer to a file or folder in __CMD__, we can just drag it into the __CMD__ window.
    * __No__ drag-drop will be working when programs are launched in ```Administrative``` mode.

## Copying files

* When we use the 'graphical' way (Ctrl+C -> Ctrl+V) of copying files and folders, we'll often notice that large folders containing a lot of files will be copied very slowly. This is because Windows is checking each and every file's attributes, permissions, etc for whatever reason before it's copying them.
* A faster and _reliable_ way to copy __entire folders__ would be via the command line (cmd.exe):
	* Windows has an in-built utility ```robocopy```; it also has __xcopy__ but the latter is rather outdated these days. In order to copy __folders__ we simply open cmd.exe and execute:
	```
	robocopy /E path\to\source_folder path\to\destination_folder
	```
	* It is not necessary that our destination folder has to pre-exist.
	* This might seem tiring, but essentially, it will copy a folder that would usually take 45 minutes to copy via GUI in about 1-2 minutes.
	* Remember, ```robocopy``` will only copy __folders__, _not_ files. If we want to copy a file, might as well put it in a folder first. Especially is the file is a large one, because robocopy has an option for that as well:
	```
	robocopy /E /J path\to\source_folder path\to\destination_folder
	```
	* Further options can be explored via:
	```
	robocopy /?
	```
	* __Moving__ files, personally, seems like a bad idea to me. I would rather copy them, make sure they we safely and properly duplicated, and only _then_ remove the previous instances. There should be an option for that there though.
* You may wish to look into [FastCopy](https://fastcopy.jp/) if superior efficiency in file transfer is something that interests you, but I'd reckon ```robocopy``` is just fine.

## Efficient Process Handling

* [ReInitialize](https://github.com/aminiqbal/win10-info/tree/main/reinitialize) contains scripts which enables us to end resource consuming/ lingering processes or perhaps even _some_ malicious services; which perhaps executed on system startup.
