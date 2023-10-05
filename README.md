# 42 Inception
## Table of Contents

 - [Docker](#docker)
 - [Why Docker come?](#)
 - [how docker provide the isolation of containers?](#)
 - [Important concepts](#)
    - [What is TLS protocol ?](#)
    - [How HTTPS works?](#)
	- [How php works?](#)
	- [FastCGI Application Server](#)


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

+ Namespaces: Namespaces isolate the container's view of the system from the host machine. This includes things like the network namespace, which isolates the container's network from the host machine's network, and the mount namespace, which isolates the container's filesystem from the host machine's filesystem.
+ Cgroups: Cgroups limit the resources that a container can use, such as CPU, memory, and disk I/O. This helps to ensure that containers do not interfere with each other or with the host machine.
+ Seccomp: Seccomp filters the system calls that a container can make. This helps to prevent containers from executing malicious code.

**Docker** also uses a number of other features to improve the isolation of containers, such as:

+ Privileged mode: Privileged mode allows containers to access certain resources that are normally restricted, such as the host machine's kernel. However, privileged mode should only be used for containers that need it, as it can reduce the security of the Docker environment.
+ Capabilities: Capabilities allow containers to have specific privileges, such as the ability to access the network or mount the filesystem. By default, containers have a very limited set of capabilities.
+ User namespaces: User namespaces allow containers to have their own user IDs and groups. This helps to prevent containers from interfering with each other or with the host machine.
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
1. **Handshake and Key Exchange**:
 When a user enters a URL with "https://" in their web browser and initiates a request to a secure website, the browser contacts the web    server.
 
 The server responds by sending its digital certificate to the browser. This certificate contains the server's public key and some information about the website.
 
 The browser verifies the certificate to ensure it's valid, issued by a trusted Certificate Authority (CA), and hasn't expired. This process is known as certificate validation.
2. **Session Key Generation**:
 
 Once the certificate is validated, the browser generates a random symmetric encryption key called the session key. This session key will be used for encrypting and decrypting the data exchanged between the browser and the server during the current session.
3. **Key Exchange**:
 
 The browser encrypts the session key using the server's public key from the certificate. This step ensures that only the server, with its corresponding private key, can decrypt the session key.
4. **Secure Communication**:
 
 With the session key securely exchanged, the browser and server switch to using symmetric encryption for the rest of the session. This is much faster than asymmetric encryption (used for the initial handshake) and is used to protect the actual data exchanged during the session.
5. **Data Transfer**:
 
 All data transmitted between the browser and server, including HTTP requests and responses, is encrypted using the session key. This encryption ensures that even if someone intercepts the data, they can't decipher it without the session key.
6. **Data Integrity**:
 
 HTTPS also ensures data integrity. Data is often hashed (transformed into a fixed-size string of characters) before encryption. When received, the server checks if the data's hash matches the received data. If they don't match, it indicates that the data has been tampered with during transmission.
7. **Termination**:
 
 When the session ends, either the browser or server can terminate it. This could happen due to inactivity or when the user closes the browser.
 
 The session key is discarded, making it difficult for anyone to decrypt past communications even if they somehow obtain the server's private key.
</details>

**`How php works?`**
PHP, which stands for "Hypertext Preprocessor," is a popular server-side scripting language used for web development. It is embedded within HTML code and executed on the server to generate dynamic web pages. 
<img src="https://dl.dropbox.com/scl/fi/a2t470ih5l7h8133v9ofu/PHP_WORKFLOW.png?rlkey=mazh3wgqq6e6dd7j5j84a39oh&dl=0"></img>

**`FastCGI Application Server`**
The FastCGI application server is a separate process or set of processes running on a different server or the same server but on a different port. It is responsible for executing the actual web application code, processing requests, and generating dynamic content. The application server communicates with the proxy server using the FastCGI protocol.