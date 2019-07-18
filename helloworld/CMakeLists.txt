cmake_minimum_required(VERSION 3.7.2)

project(helloworld C)

DeclareCAmkESComponent(Client SOURCES components/Client/src/client.c)
DeclareCAmkESComponent(Hello SOURCES components/Hello/src/hello.c)

DeclareCAmkESRootserver(helloworld.camkes)
