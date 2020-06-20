#!/usr/bin/env bash


# https://maven.apache.org/guides/getting-started/index.html

# https://maven.apache.org/
# https://maven.apache.org/download.cgi


# 清理所有生成的class和jar；
mvn clean
# 先清理，再执行到compile；
mvn clean compile
# 先清理，再执行到test，因为执行test前必须执行compile，所以这里不必指定compile；
mvn clean test
# 先清理，再执行到package。
mvn clean package

mvn tomcat:run


mvn archetype:generate \
  -DarchetypeGroupId=org.apache.maven.archetype \
  -DarchetypeArtifactId=maven-archetype-quickstart \
  -DarchetypeVersion=1.4 \
  -DgroupId=hello.maven.simple1  \
  -DartifactId=hello1


mvn archetype:generate ^
  -DarchetypeArtifactId=maven-archetype-quickstart ^
  -DarchetypeVersion=1.4 ^
  -DgroupId=hello.maven.hello1  ^
  -DartifactId=hello1

mvn archetype:generate ^
  -DarchetypeArtifactId=maven-archetype-quickstart ^
  -DarchetypeVersion=1.4 ^
  -DgroupId=hello.maven.hello11  ^
  -DartifactId=hello11

mvn archetype:generate ^
  -DarchetypeArtifactId=maven-archetype-quickstart ^
  -DarchetypeVersion=1.4 ^
  -DgroupId=hello.maven.hello12 ^
  -DartifactId=hello12


# brief
# https://www.liaoxuefeng.com/wiki/1252599548343744/1255945359327200


# Maven 1000+ 模板
# https://maven.apache.org/guides/mini/guide-creating-archetypes.html
# https://mvnrepository.com/open-source/maven-archetypes
mvn archetype:generate > templates.txt # waiting few seconds,then exits
mvn archetype:generate # 选择模板


mvn archetype:generate                                  \
  -DarchetypeGroupId=<archetype-groupId>                \
  -DarchetypeArtifactId=<archetype-artifactId>          \
  -DarchetypeVersion=<archetype-version>                \
  -DgroupId=<my.groupid>                                \
  -DartifactId=<my-artifactId>

### mvn archetype:generate
## spring mvc
# https://mvnrepository.com/artifact/co.ntier/spring-mvc-archetype/1.0.2
mvn archetype:generate -DarchetypeGroupId=co.ntier -DarchetypeArtifactId=spring-mvc-archetype -DarchetypeVersion=1.0.2
# https://mvnrepository.com/artifact/org.fluttercode.knappsack/spring-mvc-jpa-archetype/1.1
mvn archetype:generate -DarchetypeGroupId=org.fluttercode.knappsack -DarchetypeArtifactId=spring-mvc-jpa-archetype -DarchetypeVersion=1.1

## hello world
# https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html
mvn --version
# Creating a Project
mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false
cd my-app
# The src/main/java directory contains the project source code, the src/test/java directory contains the test source, and the pom.xml file is the project's Project Object Model, or POM.
cat >> pom.xml <<EOF
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>com.mycompany.app</groupId>
  <artifactId>my-app</artifactId>
  <version>1.0-SNAPSHOT</version>

  <properties>
    <maven.compiler.source>1.7</maven.compiler.source>
    <maven.compiler.target>1.7</maven.compiler.target>
  </properties>

  <dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>4.12</version>
      <scope>test</scope>
    </dependency>
  </dependencies>
</project>
EOF
mvn package
java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App
mvn clean dependency:copy-dependencies package
# Generating the Site
mvn site


# install on windows
# 添 加 MAVEN_HOME 环 境 变 量 ， 值 为 MAVEN 的 解 压 缩 目 录 。 把 MAVEN 的 bin 目 录
# （%MAVEN_HOME%\bin）加入系统的 Path 环境变量
MAVEN_HOME=D:\tools\maven-3
# 运行命令提示符（cmd），输入 mvn -v 并回车测试 Maven 是否安装成功，

cd $MAVEN_HOME
cat >> conf/settings.conf <<EOF
  <mirrors>
    <mirror>
      <id>nexus-aliyun</id>
      <mirrorOf>central</mirrorOf>
      <name>Nexus aliyun</name>
      <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
    </mirror>
  </mirrors>
EOF

