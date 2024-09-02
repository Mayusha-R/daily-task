# Deploy a Multi-tier web app

**Objective**: Automate the setup of a multi-tier web application stack with separate database and application servers using Ansible.

### Problem Statement

**Objective**: Automate the deployment and configuration of a multi-tier web application stack consisting of:

   1. Database Server: Set up a PostgreSQL database server on one Ubuntu instance.
   2. Application Server: Set up a web server (e.g., Apache or Nginx) on another Ubuntu instance to host a web application.
   3. Application Deployment: Ensure the web application is deployed on the application server and is configured to connect to the PostgreSQL database on the database server.
   4. Configuration Management: Use Ansible to automate the configuration of both servers, including the initialization of the database and the deployment of the web application.


**Deliverables**
   1. Ansible Inventory File
   + Filename: inventory.ini
   + Content: Defines the database server and application server instances, including their IP addresses and connection details.
   
![](image01.png)

   2. Ansible Playbook
   + Filename: deploy_multitier_stack.yml
   + Content: Automates:
	The deployment and configuration of the PostgreSQL database server.
	The setup and configuration of the web server.
      	The deployment of the web application and its configuration to connect to the database.
   
   3. Jinja2 Template
   + Filename: templates/app_config.php.j2
   + Content: Defines a configuration file for the web application that includes placeholders for dynamic values such as database connection details.
   
   4. Application Files
   + Filename: files/index.html
   + Content: Static or basic dynamic content served by the web application.


![](image02.png)



