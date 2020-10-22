# make report - rule for making report  
info550.html: muse_randomized_scored.csv fig1.png fig2.png info550.Rmd
	Rscript -e "rmarkdown::render('info550.Rmd', quiet = TRUE)"

# make fig2 - rule for making figure 2
fig2.png: make_fig2.R muse_randomized_scored.csv
	chmod +x make_fig2.R && \
	Rscript make_fig2.R

# make fig1 - rule for making figure 1
fig1.png: make_fig1.R muse_randomized_scored.csv
	chmod +x make_fig1.R && \
	Rscript make_fig1.R

# make score - rule for scoring PHQ-4 (full scake and subscales)
muse_randomized_scored.csv: score_PHQ4.R muse_randomized.csv
	chmod +x score_PHQ4.R && \
	Rscript score_PHQ4.R

# make install - rule for installing necessary R packages
.PHONY: install
	chmod +x install_packages.R && \
	Rscript install_packages.R

# make help
.PHONY: help
	help:
	@echo "info550.html : Generate final analysis report."
	@echo "fig2.png : Make a plot of proportion of participants at risk for anxiety."
	@echo "fig1.png : Make a plot of proportion of participants at risk for depression."
	@echo "muse_randomized_scored.csv : Score PHQ-4, PHQ-2A, PHQ-2D."
	@echo "install : Install relevant R packages."