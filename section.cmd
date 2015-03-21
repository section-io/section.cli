@echo off
setlocal

set rubyexe=ruby.exe
where /q %rubyexe% 2>NUL >NUL && goto foundruby

for /f "delims=" %%A in ('where vagrant.exe') do set rubyexe=%%~dpA..\embedded\bin\ruby.exe
if not exist "%rubyexe%" (
  echo Vagrant should be installed and on the PATH.
  echo Vagrant can be downloaded at https://www.vagrantup.com/
  echo Alternatively, for limited scenarios, Ruby should be installed and on the PATH.
  echo Ruby can be downloaded at http://rubyinstaller.org/
  exit /b 1
)

:foundruby
"%rubyexe%" "%~dp0section" %*
