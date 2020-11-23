# make report
report: muse_randomized_scored.csv Figures/fig1.png Figures/fig2.png report.Rmd
	Rscript -e "rmarkdown::render('report.Rmd', output_file = 'Output/report.html')"

# make fig2 - rule for making figure 2
Figures/fig2.png: R/make_fig2.R muse_randomized_scored.csv
	chmod +x R/make_fig2.R && \
	Rscript R/make_fig2.R

# make fig1 - rule for making figure 1
Figures/fig1.png: R/make_fig1.R muse_randomized_scored.csv
	chmod +x R/make_fig1.R && \
	Rscript R/make_fig1.R

# make score - rule for scoring PHQ-4 (full scake and subscales)
muse_randomized_scored.csv: R/score_PHQ4.R Raw_Data/muse_randomized.csv
	chmod +x R/score_PHQ4.R && \
	Rscript R/score_PHQ4.R

# make install - rule for installing necessary R packages
install:
	chmod +x R/install_packages.R && \
	Rscript R/install_packages.R


# build and run docker image
build: 
	docker build -t info550-proj .
run:
	docker run -v /Users/Shauna/Desktop/info550-master:/project info550-proj

# make help
.PHONY: help
	help:
	@echo "report.html : Generate final analysis report."
	@echo "fig2.png : Make a plot of proportion of participants at risk for anxiety."
	@echo "fig1.png : Make a plot of proportion of participants at risk for depression."
	@echo "muse_randomized_scored.csv : Score PHQ-4, PHQ-2A, PHQ-2D."
	@echo "install : Install relevant R packages."
