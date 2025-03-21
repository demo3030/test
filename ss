<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-shade-plugin</artifactId>
    <version>3.2.4</version>
    <executions>
        <execution>
            <phase>package</phase>
            <goals>
                <goal>shade</goal>
            </goals>
            <configuration>
                <shadedArtifactAttached>true</shadedArtifactAttached>
                <shadedClassifierName>all</shadedClassifierName>
                <filters>
                    <filter>
                        <artifact>*:*</artifact>
                        <excludes>
                            <exclude>META-INF/*.SF</exclude>
                            <exclude>META-INF/*.DSA</exclude>
                            <exclude>META-INF/*.RSA</exclude>
                        </excludes>
                    </filter>
                </filters>
                <transformers>
                    <!-- Include the target/lib JARs inside the final fat JAR under /lib -->
                    <transformer implementation="org.apache.maven.plugins.shade.resource.IncludeResourceTransformer">
                        <resource>
                            <directory>${project.build.directory}/lib</directory>
                            <includes>**/*.jar</includes>
                            <target>/lib/</target>
                        </resource>
                    </transformer>
                    <!-- Ensure Manifest has the correct Main-Class -->
                    <transformer implementation="org.apache.maven.plugins.shade.resource.ManifestResourceTransformer">
                        <mainClass>your.main.Class</mainClass>
                    </transformer>
                </transformers>
            </configuration>
        </execution>
    </executions>
</plugin>
