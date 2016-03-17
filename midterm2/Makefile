URL=http://downloads.yeastgenome.org/curation/chromosomal_feature/saccharomyces_cerevisiae.gff

.PHONY: clean cleanall

all: verified_fasta.fa

saccharomyces_cerevisiae.gff:
##	Choose whether to download via wget or curl.
##	Uncomment the one that works for your system.
	wget -O saccharomyces_cerevisiae.gff $(URL) #download from the URL
#	curl -o saccharomyces_cerevisiae.gff $(URL)

table.txt fasta.fa: saccharomyces_cerevisiae.gff
	bash make_table_and_fasta.sh saccharomyces_cerevisiae.gff table.txt fasta.fa #runs script, names input/output files

verified_genes.bed: table.txt
	bash make_verified_genes.sh table.txt verified_genes.bed #runs script, names input/output files

verified_fasta.fa: fasta.fa verified_genes.bed
	bash make_verified_fasta.sh fasta.fa verified_genes.bed verified_fasta.fa #runs script, names input/output files

clean:
	rm saccharomyces_cerevisiae.gff				#files to remove with clean command
	rm table.txt verified_genes.bed

cleanall: clean
	rm verified_fasta.fa						#files to remove with cleanall command
	
