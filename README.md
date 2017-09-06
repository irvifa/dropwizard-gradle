A minimal Dropwizard getting started project using Gradle. Use [shadowJar plugin](https://github.com/johnrengelman/shadow) to create fat jars. 

To create a fat jar:
```
./gradlew shadowJar
```

To run your application:
```
java -jar build/libs/dropwizard-gradle-1.0-SNAPSHOT-all.jar server hello-world.yml
```

You could run the application using Docker with this command

```
./run.sh
```