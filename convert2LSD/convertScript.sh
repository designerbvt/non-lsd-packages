#!/bin/bash

BASE_PATH="/path/to/parent/folder"

# Loop through all subfolders
for folder in "$BASE_PATH"/*/; do
    mkdir -p "$folder/src" "$folder/bin"

    # Generate .project file
    cat <<EOL > "$folder/.project"
    <?xml version="1.0" encoding="UTF-8"?>
    <projectDescription>
        <name>$(basename "$folder")</name>
        <comment></comment>
        <projects></projects>
        <buildSpec>
            <buildCommand>
                <name>org.eclipse.jdt.core.javabuilder</name>
                <arguments></arguments>
            </buildCommand>
            <buildCommand>
                <name>com.softwareag.is.vcsintegration.ISPackageBuilder</name>
                <arguments></arguments>
            </buildCommand>
        </buildSpec>
        <natures>
            <nature>org.eclipse.jdt.core.javanature</nature>
            <nature>com.softwareag.is.vcsintegration.nature</nature>
        </natures>
    </projectDescription>
    EOL

    # Generate .classpath file
    cat <<EOL > "$folder/.classpath"
    <?xml version="1.0" encoding="UTF-8"?>
    <classpath>
        <classpathentry kind="src" path="src"/>
        <classpathentry kind="con" path="org.eclipse.jdt.launching.JRE_CONTAINER"/>
        <classpathentry kind="output" path="bin"/>
    </classpath>
    EOL

    echo "Eclipse project files created for $folder."
done


