FROM Java:17
EXPOSE 8080
ADD target/Task_1.jar Task_1.jar
ENTRYPOINT ["java","-jar","Task_1.jar"]
