 <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-antrun-plugin</artifactId>
                <version>1.8</version>
                <executions>
                    <execution>
                        <phase>generate-resources</phase>
                        <goals>
                            <goal>run</goal>
                        </goals>
                        <configuration>
                            <target>
                                <copy todir="${project.build.directory}/lib">
                                    <fileset dir="${project.basedir}/src/main/resources/lib" includes="**/*.jar"/>
                                </copy>
                            </target>
                        </configuration>
                    </execution>
                </executions>
            </plugin>
