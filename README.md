## INFO-550 Project Instructions

For this project, I will analyze data collected by a research team I work with in the Global Health and Environmental Health departments. The data is part of a study called the MUSE Project, which is aiming to develop and validate a collection of measures around women's WASH-related empowerment in urban contexts. As part of the validation efforts, the survey contains several measures of mental health, including the PHQ-4 which includes thresholds for identifying whether someone is at risk for clinical levels of anxiety and clinical levels of depression.

Data analysis will be run using `R`. All analyses can be run through the terminal using a Make file run through a Docker image from Docker Hub. The make file contains a help rule, a rule for installing neccessary `R` packages, a rule for scoring the PHQ-4, 2 rules for making figures, and rule for compiling the final report.

## Execute the analysis
To execute the analysis, you can follow 3 easy steps.

1. First, fork and clone this repository to download all files locally to your computer - the files should be in a folder called `info550`.

2. Change your working directory in terminal to where the downloaded files are.

3. While in the working directory from above, and execute the analysis using the following 2 commands. Note, you will need to change `~/info550` to the file path to your `info550` folder
``` bash
docker pull 35708b/info550:latest
docker run -v ~/info550:/project/ 35708b/info550:latest
```
The container is not being run interactively, so it will run and then exit. Once you’ve exited the container, you should see a report.html in the Output folder.
