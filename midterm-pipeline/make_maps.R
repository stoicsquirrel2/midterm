#!/usr/bin/Rscript
args = commandArgs(trailingOnly=TRUE)
if(length(args) < 3) {									#error check
    scriptname = substr(grep("^--file=",commandArgs(),value=TRUE),8,1000)
    cat("Usage: Rscript --vanilla",scriptname,"chromosomes.txt verified_genes.txt fig.pdf\n")
    quit(status=1)
}

chromosome_file = args[1]		#assigns variables to file names
gene_file = args[2]
pdf_file = args[3]

chromosome_data = read.delim(chromosome_file, header=F)		#reads in delimited text files w/no header
gene_data = read.delim(gene_file, header=F)


pdf(pdf_file, width=7, height=7)		#sets size of pdf file
par(mfrow=c(4,1),mai=c(0.6,0.4,0.1,0.1))

for(index in 1:nrow(chromosome_data)) {				
	seq_name = chromosome_data$V1[index]	#assigns chromosome name to variable seq_name
	if(seq_name == "chrmt") {		#continues until it gets to chrmt
		next;
	}
	start = chromosome_data$V2[index]/1000	#converts numbers to kb
	end = chromosome_data$V3[index]/1000

	pick = gene_data$V1 == seq_name		#matches verified gene chromosome to the current seq_name
	data = gene_data[pick,]
	pos_strand = data$V4 == "+"		#assigns gene on positive strand to variable pos_strand
	# See http://geneontology.org/page/documentation
	# See http://amigo.geneontology.org/amigo/term/GO:0006364
	rRNAProcessing = grepl("GO:0006364",data$V5)	#if the GO term is in column 5, it is seat to variable rRNAProcessing

	plot(1,1,ylab="",xlab="",
		ylim=c(0,1), xlim=c(start,end),
		type="n",yaxt="n")
	mtext("position (kb)",1,line=2.5,cex=1.2^-1)
	mtext(seq_name,2,line=1)
	
	#plots the start and end positionof the rRNA processing gene fouund on each chromosome on the positive strand
	n = pos_strand
	rect(data$V2[n]/1000,0.5,data$V3[n]/1000,1,border=NA,col=ifelse(rRNAProcessing[n], "#FF0000", "#FFF0F0"))
	#plots the start and end position of the rRNA processing gene fouund on each chromosome on the negative strand
	n = !pos_strand
	rect(data$V2[n]/1000,0,data$V3[n]/1000,0.5,border=NA,col=ifelse(rRNAProcessing[n], "#0000FF", "#F0F0FF"))

}
title(main = NULL, sub = "For the S. cerevisiae genome, the 35s primary transcript processing sites \nwere located using the gene ontology reference GO:0006365. These sites are plotted by chromosome, with those on the positive strand in red, and the negative strand in blue", cex.sub = 0.75, font.sub = 3, col.sub = "red",
	      line = NA, outer = FALSE)
invisible(dev.off())
embedFonts(pdf_file, options="-DPDFSETTINGS=/prepress")
