<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-antrun-plugin</artifactId>
    <version>3.0.0</version>
    <executions>
        <execution>
            <id>copy-custom-libs</id>
            <phase>process-resources</phase>
            <goals>
                <goal>run</goal>
            </goals>
            <configuration>
                <target>
                    <mkdir dir="${project.build.outputDirectory}/lib" />
                    <copy todir="${project.build.outputDirectory}/lib">
                        <fileset dir="${project.basedir}/src/main/resources/lib">
                            <include name="**/*.jar" />
                        </fileset>
                    </copy>
                </target>
            </configuration>
        </execution>
    </executions>
</plugin>
