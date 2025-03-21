<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
                             http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.praveen</groupId>
    <artifactId>praveen-sample</artifactId>
    <version>1.0.0</version>
    <packaging>jar</packaging>

    <dependencies>
        <!-- Example of adding system JAR as a dependency -->
        <dependency>
            <groupId>com.praveen</groupId>
            <artifactId>utility</artifactId>
            <version>1.0.0</version>
            <scope>system</scope>
            <systemPath>${project.basedir}/src/main/resources/lib/utility-1.0.0.jar</systemPath>
        </dependency>
        <!-- Add any other system dependencies here -->
    </dependencies>

    <build>
        <plugins>
            <!-- Maven Antrun Plugin: Copy system JARs into a lib folder -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-antrun-plugin</artifactId>
                <version>3.0.0</version>
                <executions>
                    <execution>
                        <phase>generate-resources</phase>
                        <goals>
                            <goal>run</goal>
                        </goals>
                        <configuration>
                            <target>
                                <!-- Copy all JAR files from lib folder to target/lib -->
                                <mkdir dir="${project.build.directory}/lib" />
                                <copy todir="${project.build.directory}/lib">
                                    <fileset dir="${project.basedir}/src/main/resources/lib">
                                        <include name="**/*.jar" />
                                    </fileset>
                                </copy>
                            </target>
                        </configuration>
                    </execution>
                </executions>
            </plugin>

            <!-- Maven Shade Plugin to package everything into a single fat JAR -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-shade-plugin</artifactId>
                <version>3.2.1</version>
                <executions>
                    <execution>
                        <phase>package</phase>
                        <goals>
                            <goal>shade</goal>
                        </goals>
                        <configuration>
                            <createDependencyReducedPom>false</createDependencyReducedPom>

                            <!-- Include the content of lib/ into the shaded JAR -->
                            <artifactSet>
                                <includes>
                                    <include>*:*</include> <!-- Include all dependencies -->
                                </includes>
                            </artifactSet>

                            <!-- Merge manifest files -->
                            <transformers>
                                <transformer implementation="org.apache.maven.plugins.shade.resource.ManifestResourceTransformer">
                                    <mainClass>com.praveen.MainClass</mainClass> <!-- Update this with your actual main class -->
                                </transformer>
                            </transformers>

                            <!-- Add lib folder to the shaded JAR -->
                            <shadedArtifactAttached>false</shadedArtifactAttached>

                            <!-- Add files from the lib folder to the shaded JAR -->
                            <filters>
                                <filter>
                                    <artifact>*:*</artifact>
                                    <includes>
                                        <include>lib/**</include> <!-- Include the lib folder inside the JAR -->
                                    </includes>
                                </filter>
                            </filters>
                        </configuration>
                    </execution>
                </executions>
            </plugin>
        </plugins>
    </build>
</project>
