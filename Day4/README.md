**Docker Project 01** 

**Project Overview** 

In this project, you'll go through all three lifecycles of Docker: pulling an image and creating a container, modifying the container and creating a new image, and finally, creating a Dockerfile to build and deploy a web application. 

**Part 1: Creating a Container from a Pulled Image** 

**Objective:** Pull the official Nginx image from Docker Hub and run it as a container. **Steps:** 

**Pull the Nginx Image:** 

docker pull nginx 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.001.png)

**Run the Nginx Container:** 

docker run --name my-nginx -d -p 8080:80 nginx 1.  

- --name my-nginx: Assigns a name to the container. 
- -d: Runs the container in detached mode. 
- -p 8080:80: Maps port 8080 on your host to port 80 in the container. 

**Verify the Container is Running:** docker ps 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.002.png)

2\.  

- Visit http://localhost:8080 in your browser. You should see the Nginx welcome page. 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.003.jpeg)

**Part 2: Modifying the Container and Creating a New Image** 

**Objective:** Modify the running Nginx container to serve a custom HTML page and create a new image from this modified container. 

**Steps:** 

**Access the Running Container:** 

docker exec -it my-nginx /bin/bash 1.  

**Create a Custom HTML Page:** 

echo "<html><body><h1>Hello from Docker!</h1></body></html>" > /usr/share/nginx/html/index.html 

 

**Exit the Container:** exit 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.004.png)

 

**Commit the Changes to Create a New Image:** 

docker commit my-nginx custom-nginx 4.  

**Run a Container from the New Image:** 

docker run --name my-custom-nginx -d -p 8081:80 custom-nginx 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.005.png)

 
5. **Verify the New Container:** 
- Visit http://localhost:8081 in your browser. You should see your custom HTML page. 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.006.jpeg)

**Part 3: Creating a Dockerfile to Build and Deploy a Web Application** 

**Objective:** Write a Dockerfile to create an image for a simple web application and run it as a container. 

**Steps:** 

**Create a Project Directory:** 

mkdir my-webapp cd my-webapp 

 
1. **Create a Simple Web Application:** 

Create an index.html file: 

<!DOCTYPE html> 

<html> 

<body> 

`    `<h1>Hello from My Web App!</h1> </body> 

</html> 

 
- Save this file in the my-webapp directory. 
3. **Write the Dockerfile:** 

Create a Dockerfile in the my-webapp directory with the following content: 

- Use the official Nginx base image FROM nginx:latest 
- Copy the custom HTML file to the appropriate location COPY index.html /usr/share/nginx/html/ 
- Expose port 80 EXPOSE 80 

  ![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.007.png)

  **Build the Docker Image:** 

  docker build -t my-webapp-image . 

 

**Run a Container from the Built Image:** 

docker run --name my-webapp-container -d -p 8082:80 my-webapp-image 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.008.png)

 
5. **Verify the Web Application:** 
- Visit http://localhost:8082 in your browser. You should see your custom web application. 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.009.jpeg)

**Part 4: Cleaning Up ![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.010.png)**

**Objective:** Remove all created containers and images to clean up your environment. **Steps:** 

**Stop and Remove the Containers:** 

docker stop my-nginx my-custom-nginx my-webapp-container docker rm my-nginx my-custom-nginx my-webapp-container 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.011.png)

1\.  **Remove the Images:** 

docker rmi nginx custom-nginx my-webapp-image 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.012.png)

**Docker Project 02**

**Project Overview** 

In this advanced project, you'll build a full-stack application using Docker. The application will consist of a front-end web server (Nginx), a back-end application server (Node.js with Express), and a PostgreSQL database. You will also set up a persistent volume for the database and handle inter-container communication. This project will take more time and involve more detailed steps to ensure thorough understanding. 

**Part 1: Setting Up the Project Structure** 

**Objective:** Create a structured project directory with necessary configuration files. **Steps:** 

**Create the Project Directory:** 

mkdir fullstack-docker-app cd fullstack-docker-app 

 

**Create Subdirectories for Each Service:** mkdir frontend backend database 

2. **Create Shared Network and Volume:** 
- Docker allows communication between containers through a shared network. 

docker network create fullstack-network 3.  

- Create a volume for the PostgreSQL database. 

docker volume create pgdata 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.013.png)

**Part 2: Setting Up the Database** 

**Objective:** Set up a PostgreSQL database with Docker. 

**Steps:** 

1. **Create a Dockerfile for PostgreSQL:** 

In the database directory, create a file named Dockerfile with the following content: 

FROM postgres:latest 

ENV POSTGRES\_USER=user 

ENV POSTGRES\_PASSWORD=password ENV POSTGRES\_DB=mydatabase 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.014.png)

**Build the PostgreSQL Image:** 

cd database 

docker build -t my-postgres-db . cd .. 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.015.png)

 

**Run the PostgreSQL Container:** 

docker run --name postgres-container --network fullstack-network -v pgdata:/var/lib/postgresql/data - d my-postgres-db 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.016.png)

**Part 3: Setting Up the Backend (Node.js with Express)** 

**Objective:** Create a Node.js application with Express and set it up with Docker. **Steps:** 

**Initialize the Node.js Application:** 

cd backend npm init -y 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.017.png)

 

**Install Express and pg (PostgreSQL client for Node.js):** 

npm install express pg 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.018.png)

 
2. **Create the Application Code:** 

In the backend directory, create a file named index.js with the following content: 

const express = require('express'); const { Pool } = require('pg'); const app = express(); 

const port = 3000; 

const pool = new Pool({ 

`    `user: 'user', 

`    `host: 'postgres-container',     database: 'mydatabase', 

`    `password: 'password', 

`    `port: 5432, 

}); 

app.get('/', (req, res) => { 

`    `res.send('Hello from Node.js and Docker!'); }); 

app.get('/data', async (req, res) => { 

`    `const client = await pool.connect(); 

`    `const result = await client.query('SELECT NOW()'); 

`    `client.release(); 

`    `res.send(result.rows); }); 

app.listen(port, () => { 

`    `console.log( App running on http://localhost:${port} ); }); 

 
4. **Create a Dockerfile for the Backend:** 

In the backend directory, create a file named Dockerfile with the following content: FROM node:latest 

WORKDIR /usr/src/app 

COPY package\*.json ./ RUN npm install 

COPY . . 

EXPOSE 3000 

CMD ["node", "index.js"] 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.019.png)

**Build the Backend Image:** 

docker build -t my-node-app . cd .. 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.020.png)

 

**Run the Backend Container:** 

docker run --name backend-container --network fullstack-network -d my-node-app 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.021.png)

**Part 4: Setting Up the Frontend (Nginx)** 

**Objective:** Create a simple static front-end and set it up with Docker. 

**Steps:** 

1. **Create a Simple HTML Page:** 

In the frontend directory, create a file named index.html with the following content: 

<!DOCTYPE html> 

<html> 

<body> 

`    `<h1>Hello from Nginx and Docker!</h1> 

`    `<p>This is a simple static front-end served by Nginx.</p> </body> 

</html> 

 
2. **Create a Dockerfile for the Frontend:** 

In the frontend directory, create a file named Dockerfile with the following content: 

FROM nginx:latest 

COPY index.html /usr/share/nginx/html/index.html 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.022.png)

**Build the Frontend Image:** 

cd frontend 

docker build -t my-nginx-app . cd .. 

 

**Run the Frontend Container:** 

docker run --name frontend-container --network fullstack-network -p 8080:80 -d my-nginx-app 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.023.png)

**Part 5: Connecting the Backend and Database** 

**Objective:** Ensure the backend can communicate with the database and handle data requests. 

**Steps:** 

1. **Update Backend Code to Fetch Data from PostgreSQL:** 
- Ensure that the index.js code in the backend handles /data endpoint correctly as written above. 
2. **Verify Backend Communication:** 

Access the backend container: 

docker exec -it backend-container /bin/bash 

Test the connection to the database using psql: 

apt-get update && apt-get install -y postgresql-client 

psql -h postgres-container -U user -d mydatabase -c "SELECT NOW();" 

Exit the container: exit 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.024.png)

3. **Test the Backend API:** 
- Visit http://localhost:3000 to see the basic message. 
- Visit http://localhost:3000/data to see the current date and time fetched from PostgreSQL. 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.025.png)

**Part 6: Final Integration and Testing** 

**Objective:** Ensure all components are working together and verify the full-stack application. **Steps:** 

1. **Access the Frontend:** 
- Visit http://localhost:8080 in your browser. You should see the Nginx welcome page with the custom HTML. 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.026.jpeg)

2. **Verify Full Integration:** 

Update the index.html to include a link to the backend: 

<!DOCTYPE html> 

<html> 

<body> 

`    `<h1>Hello from Nginx and Docker!</h1> 

`    `<p>This is a simple static front-end served by Nginx.</p> 

`    `<a href="http://localhost:3000/data">Fetch Data from Backend</a> </body> 

</html> 

 

**Rebuild and Run the Updated Frontend Container:** 

cd frontend 

docker build -t my-nginx-app . 

docker stop frontend-container 

docker rm frontend-container 

docker run --name frontend-container --network fullstack-network -p 8080:80 -d my-nginx-app cd .. 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.027.png)

3. **Final Verification:** 
- Visit http://localhost:8080 and click the link to fetch data from the backend. 

**Part 7: Cleaning Up** 

**Objective:** Remove all created containers, images, networks, and volumes to clean up your environment. 

**Steps:** 

**Stop and Remove the Containers:** 

docker stop frontend-container backend-container postgres-container docker rm frontend-container backend-container postgres-container 

1\.  

**Remove the Images:** 

docker rmi my-nginx-app my-node-app my-postgres-db 2.  

**Remove the Network and Volume:** 

docker network rm fullstack-network docker volume rm pgdata 

![](Aspose.Words.0a431322-451f-4792-a334-89b2a9071788.028.png)
