This pipeline reads in the S. cerevisiae genome file in .gff format and finds and plots the position of the rRNA processing site for each verified 
gene by chromosome.  The .gff file is downloaded from yeastgenome.org.  Initially, the file is parsed to remove FASTA data and comments,
and the resulting table is saved in a new file: table.txt. The file is first used to extract the chromosome information, where the chromosome,
and chromosome start and end position are saved into another file: chromosomes.txt.  Next genes with verified open reading frames are extracted 
table.txt.  For each of these genes the following information: chromosome, start position, end position, strand (+/-),GO terms; is saved in the 
file: verified_genes.txt. Chromosome.txt and verified_genes.txt are passed into R to plot the location of the 35S primary transcript processing
gene based on the gene ontology term: GO0006365.  The informaion from chromosome.txt is used to create the plot size for each chomosome.  
Then, verified_genes.txt is searched for GO0006365 and if found, the start/end postion of that gene is plotted on its respective chromosome
with those positioned on the positive strand plotted in red and those on the negative are in blue.
Software needed for pipeline: Unix/Linux to run .sh (or through third party software run on Windows) and R 
