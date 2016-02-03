@echo off
setlocal

set rubyexe=ruby.exe

for /f "delims=" %%A in ('where vagrant.exe') do set rubyexe=%%~dpA..\embedded\bin\ruby.exe
if not exist "%rubyexe%" (
  echo Vagrant should be installed and on the PATH.
  echo Vagrant can be downloaded at https://www.vagrantup.com/
  exit /b 1
)

"%rubyexe%" "%~dp0section" %*
