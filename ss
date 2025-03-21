<pluginManagement>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-antrun-plugin</artifactId>
                <version>3.0.0</version>
                <executions>
                    <execution>
                        <id>copy-libs</id>
                        <phase>process-resources</phase>
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
        </plugins>
    </pluginManagement>
