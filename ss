<assembly xmlns="http://maven.apache.org/ASSEMBLY/2.1.0" 
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/ASSEMBLY/2.1.0 http://maven.apache.org/xsd/assembly-2.1.0.xsd">
    <id>custom-assembly</id>
    <formats>
        <format>zip</format>
    </formats>

    <fileSets>
        <!-- Include main JAR -->
        <fileSet>
            <directory>target</directory>
            <outputDirectory>/lib</outputDirectory>
            <includes>
                <include>${project.artifactId}-${project.version}.jar</include>
            </includes>
        </fileSet>

        <!-- Include JARs from src/main/resources/lib -->
        <fileSet>
            <directory>src/main/resources/lib</directory>
            <outputDirectory>/lib</outputDirectory>
            <includes>
                <include>*.jar</include>
            </includes>
        </fileSet>
    </fileSets>
</assembly>
