URL=http://downloads.yeastgenome.org/curation/chromosomal_feature/saccharomyces_cerevisiae.gff

.PHONY: clean cleanall

all: fig-maps.pdf

saccharomyces_cerevisiae.gff:
##	Choose whether to download via wget or curl.
##	Uncomment the one that works for your system.
	wget -O saccharomyces_cerevisiae.gff $(URL)
#	curl -o saccharomyces_cerevisiae.gff $(URL)

table.txt: saccharomyces_cerevisiae.gff
	bash make_table.sh saccharomyces_cerevisiae.gff table.txt

chromosomes.txt: table.txt
	bash make_chromosomes.sh table.txt chromosomes.txt

verified_genes.txt: table.txt
	bash make_verified_genes.sh table.txt verified_genes.txt

fig-maps.pdf: chromosomes.txt verified_genes.txt
	Rscript --vanilla make_maps.R chromosomes.txt verified_genes.txt fig-maps.pdf

clean:
	rm saccharomyces_cerevisiae.gff
	rm table.txt chromosomes.txt verified_genes.txt

cleanall: clean
	rm fig-maps.pdf
