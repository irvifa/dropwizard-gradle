# Dropwizard gradle

A minimal Dropwizard getting started project using Gradle. Use [shadowJar plugin](https://github.com/johnrengelman/shadow) to create fat jars. 

To create a fat jar:
```
./gradlew shadowJar
```

## Using cloudbuilder

- Create a build triggers based on release tag
- Each time we push changes to release branch cloudbuilder will deploy latest image to our k8s apps