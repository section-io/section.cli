@echo off
setlocal

set rubyexe=ruby.exe
where /q %rubyexe% 2>NUL >NUL && goto foundruby

for /f "delims=" %%A in ('where vagrant.exe') do set rubyexe=%%~dpA..\embedded\bin\ruby.exe
if not exist "%rubyexe%" (
  echo Ruby must be installed and on the PATH. Ruby can be downloaded at http://rubyinstaller.org/
  exit /b 1
)

:foundruby
"%rubyexe%" "%~dp0section" %*
