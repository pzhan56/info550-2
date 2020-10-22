#! /usr/local/bin/Rscript

install_pkgs <- row.names(installed.packages())
pkgs <- c("ggplot2", "dplyr", "wesanderson")
for(p in pkgs){
	if(!(p %in% install_pkgs)){
		install.packages(p)
	}
}
