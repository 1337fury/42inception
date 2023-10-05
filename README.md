# 42 Inception
## Table of Contents

 - [Docker](#docker)
 - [Why Docker come?](#)
 - [Requirement](#)
    - [Nginx](#)
    - [Mariadb](#)
    - [Wordpress](#)

## Docker
Docker is an open-source platform that allows developers to build, ship, and run applications within a standardized, isolated environment called a container. This containerization enables applications to be separated from the infrastructure, making software delivery faster and more efficient. Each container includes everything needed to run an application, such as code, runtime, system tools, libraries, and settings, and does not depend on the host system's installations.

#### The Docker platform includes several key components:
- **`Docker Engine`**: The underlying technology that manages Docker containers and handles container objects. It listens for requests sent via the Docker Engine API [en.wikipedia.org](https://en.wikipedia.org/wiki/Docker_(software)).
- **`Docker Images`**: Read-only templates used to build containers. Images contain the application and its dependencies, and are used to store and ship applications [en.wikipedia.org](https://en.wikipedia.org/wiki/Docker_(software)).
- **`Docker Containers`**: Live, running instances of **`Docker images`**. Users can interact with them, and administrators can adjust their settings using Docker commands [ibm.com](https://www.ibm.com/topics/docker).
- **`Docker Services`**: Allow containers to be scaled across multiple Docker daemons, resulting in a swarm, a set of cooperating daemons communicating through the Docker API [en.wikipedia.org](https://en.wikipedia.org/wiki/Docker_(software)).
- **`Docker Registry`**: A repository for Docker images. Docker clients connect to registries to download ("pull") images for use or upload ("push") images they have built [en.wikipedia.org](https://en.wikipedia.org/wiki/Docker_(software)).


<img src="https://dl.dropbox.com/scl/fi/ksye3kvwn5dtthtkb65ig/DockerArch.png?rlkey=2o6gmlsh8mjczvdlzb14u7wy2&dl=0"></img>

## Why Docker come?

**Docker** came to be in response to the growing challenges of software development and deployment. In the early days of software development, applications were typically deployed on monolithic servers, which meant that all of the application's components (code, libraries, operating system, etc.) were installed and running on the same server. This approach was simple, but it had a number of drawbacks, including:

- **`Scalability`**: Monolithic servers can be difficult to scale up or down to meet demand.
- **`Portability`**: Monolithic applications can be difficult to deploy on different platforms, such as different operating systems or cloud environments.
- **`Reliability`**: If one component of a monolithic application fails, the entire application can go down.
**Docker** provides a solution to these challenges by introducing the concept of containerization. Containers are lightweight, isolated environments that encapsulate an application's code, libraries, and operating system dependencies. This allows applications to be run on any platform that has the Docker runtime installed, regardless of the underlying operating system.

