# create the 5 by 10 matrix of random integers
m = matrix(sample(1:100, 50, replace = FALSE), nrow = 5, ncol = 10)

# set the names of columns and rows
colnames(m) <- c("cond1", "cond2", "cond3", "cond4", "cond5", "ctrl1", "ctrl2",
                 "ctrl3", "ctrl4", "ctrl5")
rownames(m) <- c("gene1", "gene2", "gene3", "gene4", "gene5")

# Fold change is computed simply as the ratio of the changes between final value
# and the original value over the initial value. Thus, if the original value is 
# X and final value is Y, the fold change is (Y - X)/X or equivalently Y/X - 1
# in this case, the condition groups are the final value, and the control groups
# are the initial value
FC <- c(0,0,0,0,0)
for (i in seq_len(nrow(m))) {
  FC[i] <- log2(mean(m[i,6:10])/mean(m[i, 1:5]))
}
# Add Fold Change column to matrix m
cbind(m, FC)

