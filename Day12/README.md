**Project 01** 

**Project Overview** 

Your organization is implementing continuous integration (CI) practices to streamline the software development lifecycle. As part of this initiative, you will create a Jenkins declarative pipeline for building a simple Maven project hosted on GitHub. This project aims to automate the build process, ensure code quality, and facilitate continuous delivery (CD). 

**Objectives** 

- Create a Jenkins pipeline script using declarative syntax. 
- Clone a Maven project from a specified GitHub repository. 
- Execute the build process and run unit tests. 
- Archive build artifacts. 
- Provide clear feedback on build status through Jenkins' UI and console output. 

**Instructions** 

1. **Setup Jenkins Job** 
- Create a new Jenkins pipeline job. 

![](Aspose.Words.73fb5d9a-c410-40c7-abb9-2a594cafee4d.001.jpeg)

- Configure the job to pull the Jenkinsfile from the GitHub repository. 

![](Aspose.Words.73fb5d9a-c410-40c7-abb9-2a594cafee4d.002.jpeg)

![](Aspose.Words.73fb5d9a-c410-40c7-abb9-2a594cafee4d.003.jpeg)

2. **Create Jenkinsfile** 
- Write a declarative pipeline script (Jenkinsfile) that includes the following stages: 
- **Clone Repository**: Clone the Maven project from the GitHub repository. 
- **Build**: Execute the Maven build process (mvn clean install). 
- **Test**: Run unit tests as part of the Maven build. 
- **Archive Artifacts**: Archive the build artifacts for future use. 

Public Repo: 

Private Repo : 

![](Aspose.Words.73fb5d9a-c410-40c7-abb9-2a594cafee4d.004.png)

3. **Configure Pipeline Parameters** 
- Allow the pipeline to accept parameters such as Maven goals and options for flexibility. 
- Ensure the pipeline can be easily modified for different build configurations. 
4. **Run the Pipeline** 
- Trigger the Jenkins pipeline job manually or set up a webhook for automatic triggering on GitHub repository changes. 
- Monitor the build process through Jenkins' UI and console output. 

Public Repo output: 

![](Aspose.Words.73fb5d9a-c410-40c7-abb9-2a594cafee4d.005.jpeg)

Test output: 

![](Aspose.Words.73fb5d9a-c410-40c7-abb9-2a594cafee4d.006.jpeg)

Pipeline overview: 

![](Aspose.Words.73fb5d9a-c410-40c7-abb9-2a594cafee4d.007.jpeg)

![](Aspose.Words.73fb5d9a-c410-40c7-abb9-2a594cafee4d.008.jpeg)

Private Repo output: 

![](Aspose.Words.73fb5d9a-c410-40c7-abb9-2a594cafee4d.009.jpeg)

Test Output: 

![](Aspose.Words.73fb5d9a-c410-40c7-abb9-2a594cafee4d.010.jpeg)

![](Aspose.Words.73fb5d9a-c410-40c7-abb9-2a594cafee4d.011.jpeg)

![](Aspose.Words.73fb5d9a-c410-40c7-abb9-2a594cafee4d.012.jpeg)
