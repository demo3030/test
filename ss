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
                <transformers>
                    <!-- Copy external JARs from target/lib into /lib inside the fat JAR -->
                    <transformer implementation="org.apache.maven.plugins.shade.resource.IncludeResourceTransformer">
                        <resource>lib</resource>
                        <file>${project.build.directory}/lib</file>
                    </transformer>
                    <!-- Ensure the Main-Class is correctly set -->
                    <transformer implementation="org.apache.maven.plugins.shade.resource.ManifestResourceTransformer">
                        <mainClass>your.main.Class</mainClass>
                    </transformer>
                </transformers>
            </configuration>
        </execution>
    </executions>
</plugin>
