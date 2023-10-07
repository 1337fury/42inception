# 42 Inception
## Table of Contents

 - [Docker](#docker)
 - [Why Docker come?](#why-docker-come?)
 - [how docker provide the isolation of containers?](#)
 - [Important concepts](#)
    - [What is TLS protocol ?](#)
    - [How HTTPS works?](#)
	- [How php works?](#)
	- [FastCGI Application Server](#)
- [Docker Network](#)
- [Docker compose](#)


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

## How docker provide the isolation of containers?

**Docker** provides the isolation of containers using a variety of Linux kernel features, including:

+ **`Namespaces`**: Namespaces isolate the container's view of the system from the host machine. This includes things like the network namespace, which isolates the container's network from the host machine's network, and the mount namespace, which isolates the container's filesystem from the host machine's filesystem.
+ **`Cgroups`**: Cgroups limit the resources that a container can use, such as CPU, memory, and disk I/O. This helps to ensure that containers do not interfere with each other or with the host machine.
+ **`Seccomp`**: Seccomp filters the system calls that a container can make. This helps to prevent containers from executing malicious code.

**Docker** also uses a number of other features to improve the isolation of containers, such as:

+ **`Privileged mode`**: Privileged mode allows containers to access certain resources that are normally restricted, such as the host machine's kernel. However, privileged mode should only be used for containers that need it, as it can reduce the security of the Docker environment.
+ **`Capabilities`**: Capabilities allow containers to have specific privileges, such as the ability to access the network or mount the filesystem. By default, containers have a very limited set of capabilities.
+ **`User namespaces`**: User namespaces allow containers to have their own user IDs and groups. This helps to prevent containers from interfering with each other or with the host machine.
Together, these features provide a high degree of isolation for Docker containers. This isolation helps to improve the security, reliability, and performance of containerized applications.

In addition to the above, Docker also provides a number of features that can be used to further improve the isolation of containers. For example, Docker can be used to create isolated networks for containers, and it can also be used to restrict the communication between containers.

Overall, Docker provides a number of powerful tools for isolating containers. By using these tools, organizations can improve the security, reliability, and performance of their containerized applications.

## Important concepts
**`What is TLS protocol ?`**

Transport Layer Security **`(TLS)`** is a cryptographic protocol designed to provide secure communication over a computer network, particularly the Internet. It is used to establish privacy and data integrity between two communicating applications.

**`TLS`** works by encrypting the data being transmitted between the user agent (like a web browser) and the server. This encryption prevents unauthorized parties from reading and interpreting the data. TLS also ensures that no information is `lost`, `damaged`, `tampered` with, or `falsified` during the process of transmission.

**`How HTTPS works?`**
<img src="https://dl.dropbox.com/scl/fi/48on4e66fx5qm7w93qfp2/HTTPS.png?rlkey=6bd20zr9p4c5r9kna314hhc60&dl=0"></img>

<details>

1. **`Handshake and Key Exchange`**: When a user enters a URL with "https://" in their web browser and initiates a request to a secure website, the browser contacts the web server.
The server responds by sending its digital certificate to the browser. This certificate contains the server's public key and some information about the website.
The browser verifies the certificate to ensure it's valid, issued by a trusted Certificate Authority (CA), and hasn't expired. This process is known as certificate validation.
3. **`Session Key Generation`**: Once the certificate is validated, the browser generates a random symmetric encryption key called the session key. This session key will be used for encrypting and decrypting the data exchanged between the browser and the server during the current session.
3. **`Key Exchange`**: The browser encrypts the session key using the server's public key from the certificate. This step ensures that only the server, with its corresponding private key, can decrypt the session key.
4. **`Secure Communication`**: With the session key securely exchanged, the browser and server switch to using symmetric encryption for the rest of the session. This is much faster than asymmetric encryption (used for the initial handshake) and is used to protect the actual data exchanged during the session.
5. **`Data Transfer`**: All data transmitted between the browser and server, including HTTP requests and responses, is encrypted using the session key. This encryption ensures that even if someone intercepts the data, they can't decipher it without the session key.
6. **`Data Integrity`**: HTTPS also ensures data integrity. Data is often hashed (transformed into a fixed-size string of characters) before encryption. When received, the server checks if the data's hash matches the received data. If they don't match, it indicates that the data has been tampered with during transmission.
7. **`Termination`**: When the session ends, either the browser or server can terminate it. This could happen due to inactivity or when the user closes the browser.
The session key is discarded, making it difficult for anyone to decrypt past communications even if they somehow obtain the server's private key.

</details>

**`How php works?`**
PHP, which stands for "Hypertext Preprocessor," is a popular server-side scripting language used for web development. It is embedded within HTML code and executed on the server to generate dynamic web pages.

<img src="https://dl.dropbox.com/scl/fi/a2t470ih5l7h8133v9ofu/PHP_WORKFLOW.png?rlkey=mazh3wgqq6e6dd7j5j84a39oh&dl=0"></img>

**`FastCGI Application Server`**
The FastCGI application server is a separate process or set of processes running on a different server or the same server but on a different port. It is responsible for executing the actual web application code, processing requests, and generating dynamic content. The application server communicates with the proxy server using the FastCGI protocol.

## Docker Network
A Docker network is a virtual network that connects Docker containers. It provides a way for containers to communicate with each other and with other hosts on the network. Docker networks are created and managed using the Docker CLI or Docker Compose.

There are two types of Docker networks:

* **Bridge networks:** Bridge networks are the most common type of Docker network. They create a virtual bridge device on the host machine and connect the containers to that bridge. This allows the containers to communicate with each other and with other hosts on the network, but it also exposes them to the public internet.
* **Overlay networks:** Overlay networks create a virtual network that spans multiple Docker hosts. This allows containers on different hosts to communicate with each other without being exposed to the public internet. Overlay networks are more complex to set up than bridge networks, but they offer better security and isolation.

Docker networks can be used to achieve a variety of goals, such as:

* **Isolating containers:** Docker networks can be used to isolate containers from each other and from the outside world. This can be useful for security purposes or to prevent containers from interfering with each other.
* **Connecting containers:** Docker networks can be used to connect containers to each other. This allows them to communicate with each other and share resources.
* **Exposing containers to the public internet:** Docker networks can be used to expose containers to the public internet. This allows you to run web applications and other services inside containers.

To create a Docker network, you can use the `docker network create` command. To connect a container to a network, you can use the `docker network connect` command. To disconnect a container from a network, you can use the `docker network disconnect` command.

For example, to create a bridge network called `my-network`, you would use the following command:

```
docker network create my-network
```

To connect a container called `web` to the `my-network` network, you would use the following command:

```
docker network connect my-network web
```

To disconnect the `web` container from the `my-network` network, you would use the following command:

```
docker network disconnect my-network web
```

Docker networks are a powerful tool that can be used to connect and isolate Docker containers. They are essential for running distributed applications and services with Docker.

## Docker compose
Docker Compose is a tool for defining and running multi-container Docker applications. With Docker Compose, you can use a YAML file to configure your application's services. Then, with a single command, you create and start all the services from your configuration.

Docker Compose works by creating a Docker network for your application and then starting each of the services in a separate container on that network. The services can then communicate with each other using the Docker network.

Docker Compose is a convenient way to manage multi-container applications because it allows you to define your entire application stack in a single file. This makes it easy to start, stop, and manage your application as a whole.

Here is an example of a Docker Compose file for a simple web application:

```yaml
version: "3"

services:
  web:
    image: nginx:latest
    ports:
      - "80:80"
    volumes:
      - ./html:/usr/share/nginx/html

  db:
    image: mysql:latest
    environment:
      MYSQL_ROOT_PASSWORD: password
    volumes:
      - ./db:/var/lib/mysql

```

This file defines two services: `web` and `db`. The `web` service uses the `nginx:latest` Docker image and exposes port 80. The `db` service uses the `mysql:latest` Docker image and exposes no ports.

To start this application, you would simply run the following command:

```
docker-compose up -d
```

This would create the Docker network, start the `web` and `db` services, and attach the `web` service to port 80 on the host machine.
