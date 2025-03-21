  <transformers>
                            

                                <!-- Add system JARs into a lib folder inside the shaded JAR -->
                                <transformer implementation="org.apache.maven.plugins.shade.resource.AppendedResourcesTransformer">
                                    <resource>${project.basedir}/src/main/resources/lib/</resource> <!-- Path to your lib folder -->
                                    <outputDirectory>lib/</outputDirectory> <!-- The lib folder inside the shaded JAR -->
                                </transformer>
                            </transformers>
