**New project using Maven:** 

![](Aspose.Words.b14163b4-5869-4869-9f72-9c7589f99ab6.001.jpeg)

added maven 3.9.0 in tools. 

![](Aspose.Words.b14163b4-5869-4869-9f72-9c7589f99ab6.002.jpeg)

create project named “Dev Compile” 

![](Aspose.Words.b14163b4-5869-4869-9f72-9c7589f99ab6.003.jpeg)

Add git repo and branch 

![](Aspose.Words.b14163b4-5869-4869-9f72-9c7589f99ab6.004.jpeg)

Add a build step that you need to perform. The Goal mentioned here is a predefined Maven goal but any other goal that we defined in the pom.xml file can be used. 

![](Aspose.Words.b14163b4-5869-4869-9f72-9c7589f99ab6.005.jpeg)

Created another project named “Dev Test” for the same repo but with a different goal in maven. 

![](Aspose.Words.b14163b4-5869-4869-9f72-9c7589f99ab6.006.jpeg)

In “Dev Compile”, add a post build action to build the “Dev Test” project after successful build of “Dev Compile”. 

“Dev Test” will be build automatically after “Dev Compile” has been build successfully.  

**Build a Pipeline View for the above projects: Dev Compile → Dev Test** 

![](Aspose.Words.b14163b4-5869-4869-9f72-9c7589f99ab6.007.jpeg)

Add the “Build Pipeline” plugin from the available plugin which is used to create the pipeline view. 

![](Aspose.Words.b14163b4-5869-4869-9f72-9c7589f99ab6.008.jpeg)

Create a new build pipeline view. 

![](Aspose.Words.b14163b4-5869-4869-9f72-9c7589f99ab6.009.jpeg)

Mention the starting project for the pipeline view which would be “Dev Compile” in our case. 

![](Aspose.Words.b14163b4-5869-4869-9f72-9c7589f99ab6.010.jpeg)

Can change display options as per requirements.  

![](Aspose.Words.b14163b4-5869-4869-9f72-9c7589f99ab6.011.jpeg)

Pipeline view when building Dev Compile. 

![](Aspose.Words.b14163b4-5869-4869-9f72-9c7589f99ab6.012.jpeg)

Pipeline view when Dev compile has successfully build and Dev Test has not yet been build. 

![](Aspose.Words.b14163b4-5869-4869-9f72-9c7589f99ab6.013.jpeg)

Pipeline view when both have been successfully build. 
