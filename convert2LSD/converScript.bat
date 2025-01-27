@echo off

set "BASE_PATH=C:\path\to\parent\folder"

for /d %%F in ("%BASE_PATH%\*") do (
    mkdir "%%F\src"
    mkdir "%%F\bin"

    REM Generate .project file
    echo ^<?xml version="1.0" encoding="UTF-8"?^> > %%F\.project
    echo ^<projectDescription^> >> %%F\.project
    echo    ^<name^>%%~nxF^</name^> >> %%F\.project
    echo    ^<comment^>^</comment^> >> %%F\.project
    echo    ^<projects^>^</projects^> >> %%F\.project
    echo    ^<buildSpec^> >> %%F\.project
    echo        ^<buildCommand^> >> %%F\.project
    echo            ^<name^>org.eclipse.jdt.core.javabuilder^</name^> >> %%F\.project
    echo            ^<arguments^>^</arguments^> >> %%F\.project
    echo        ^</buildCommand^> >> %%F\.project
    echo        ^<buildCommand^> >> %%F\.project
    echo            ^<name^>com.softwareag.is.vcsintegration.ISPackageBuilder^</name^> >> %%F\.project
    echo            ^<arguments^>^</arguments^> >> %%F\.project
    echo        ^</buildCommand^> >> %%F\.project
    echo    ^</buildSpec^> >> %%F\.project
    echo    ^<natures^> >> %%F\.project
    echo        ^<nature^>org.eclipse.jdt.core.javanature^</nature^> >> %%F\.project
    echo        ^<nature^>com.softwareag.is.vcsintegration.nature^</nature^> >> %%F\.project
    echo    ^</natures^> >> %%F\.project
    echo ^</projectDescription^> >> %%F\.project

    REM Generate .classpath file
    echo ^<?xml version="1.0" encoding="UTF-8"?^> > %%F\.classpath
    echo ^<classpath^> >> %%F\.classpath
    echo    ^<classpathentry kind="src" path="src" /^> >> %%F\.classpath
    echo    ^<classpathentry kind="con" path="org.eclipse.jdt.launching.JRE_CONTAINER" /^> >> %%F\.classpath
    echo    ^<classpathentry kind="output" path="bin" /^> >> %%F\.classpath
    echo ^</classpath^> >> %%F\.classpath

    echo Eclipse project files created for %%F.
)


