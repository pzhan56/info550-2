## INFO-550 Project Instructions

For this project, I will analyze data collected by a research team I work with in the Global Health and Environmental Health departments. The data is part of a study called the MUSE Project, which is aiming to develop and validate a collection of measures around women's WASH-related empowerment in urban contexts. As part of the validation efforts, the survey contains several measures of mental health, including the PHQ-4 which includes thresholds for identifying whether someone is at risk for clinical levels of anxiety and clinical levels of depression.

To analyze the data you will need to install some `R` packages. The required packages can be installed using `R` commands.

``` r
install_pkgs <- row.names(installed.packages())
pkgs <- c("ggplot2", "dplyr", "wesanderson")
for(p in pkgs){
	if(!(p %in% install_pkgs)){
		install.packages(p)
	}
}
```
## Execute the analysis
To execute the analysis, you can run:
``` bash
Rscript -e "rmarkdown::render('info550.Rmd')"
```
This will create a file called info550.html that contains the results.
