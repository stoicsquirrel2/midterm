URL=http://downloads.yeastgenome.org/curation/chromosomal_feature/saccharomyces_cerevisiae.gff

.PHONY: clean cleanall

all: fig-maps.pdf

saccharomyces_cerevisiae.gff:
##	Choose whether to download via wget or curl.
##	Uncomment the one that works for your system.
	wget -O saccharomyces_cerevisiae.gff $(URL) #download from the URL
#	curl -o saccharomyces_cerevisiae.gff $(URL)

table.txt: saccharomyces_cerevisiae.gff
	bash make_table.sh saccharomyces_cerevisiae.gff table.txt #runs script, names input/output files

chromosomes.txt: table.txt
	bash make_chromosomes.sh table.txt chromosomes.txt #runs script, names input/output files

verified_genes.txt: table.txt
	bash make_verified_genes.sh table.txt verified_genes.txt #runs script, names input/output files

fig-maps.pdf: chromosomes.txt verified_genes.txt
	Rscript --vanilla make_maps.R chromosomes.txt verified_genes.txt fig-maps.pdf #runs script, names input/output files

clean:
	rm saccharomyces_cerevisiae.gff				#files to remove with clean command
	rm table.txt chromosomes.txt verified_genes.txt

cleanall: clean
	rm fig-maps.pdf						#files to remove with cleanall command
