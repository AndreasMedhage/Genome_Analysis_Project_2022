# Get args
args <- commandArgs(TRUE);
out <- args[1];
dir <- args[2]; 

condition = as.factor(c("continious", "continious", "mineral", "mineral", "continious"))
# Find files
sFiles <- grep("ERR20366",list.files(dir),value=TRUE);
sTable <- data.frame(sampleName = sFiles, fileName = sFiles, condition = condition)

# Running DESeq2
suppressMessages(library("DESeq2"));
dds = DESeqDataSetFromHTSeqCount(sampleTable = sTable,directory = dir, design= ~ condition);
dds$condition <- factor(dds$condition, levels = c("continious","mineral"));
dds <- DESeq(dds);
res <- results(dds);

# Save result
resOrdered <- res[order(res$pvalue),];
write.csv(as.data.frame(resOrdered), file=paste(out,"/mineral_continous_results.csv",sep=""));

# Save summary
sink(paste(out,"/summary.txt",sep=""));
print(summary(res));
print('\n');
print(paste("pvalues<0.1: ", sum(res$padj < 0.1, na.rm=TRUE)));
sink();

# shirk
resLFC <- lfcShrink(dds, coef="condition_mineral_vs_continious", type="apeglm");
resNorm <- lfcShrink(dds, coef=2, type="normal");

# Plots

png(paste(out,"/plotCounts.png",sep=""));
plotCounts(dds, gene=which.min(res$padj), intgroup="condition");
dev.off();

ymax <- 3;

png(paste(out,"/MAplot.png",sep=""));
plotMA(res, ylim=c(-ymax,ymax));
dev.off();

png(paste(out,"/DispEstsplot.png",sep=""));
plotDispEsts( dds, ylim = c(1e-6, 1e1) );
dev.off();

png(paste(out,"/lfcMAplot_apeglm.png",sep=""));
plotMA(resLFC, ylim=c(-ymax,ymax));
dev.off();

png(paste(out,"/lfcMAplot_Norm.png",sep=""));
plotMA(resNorm, ylim=c(-ymax,ymax));
dev.off();

# pca
rld <- vst( dds , blind=FALSE); # extract transformed

png(paste(out,"/PCA_plot.png",sep=""));
plotPCA(rld, intgroup = "condition");
dev.off();
