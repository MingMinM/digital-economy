library(ggplot2)
library(GGally)
library(readxl)
library(showtext)
data = read_xlsx("各省面板综合评价空间面板半参数.xlsx")
data = data[,3:7]


font_add("myfont","C:/Windows/Fonts/simhei.ttf")
font_families()
showtext_auto()


ggscatter <- function(data, mapping, ...) {
  x <- GGally::eval_data_col(data, mapping$x)
  y <- GGally::eval_data_col(data, mapping$y)
  df <- data.frame(x = x, y = y)
  sp1 <- ggplot(df, aes(x=x, y=y)) +
    geom_point()
  return(sp1)
}

ggdehist <- function(data, mapping, ...) {
  x <- GGally::eval_data_col(data, mapping$x)
  df <- data.frame(x = x)
  dh1 <- ggplot(df, aes(x=x)) +
    geom_histogram(aes(y=..density..), bins = 50, fill = 'steelblue', color='black', alpha=.4) +
    geom_density(aes(y=..density..)) + 
    theme_minimal()
  return(dh1)
}


ggpairs(data,
        lower = list(continuous = wrap(ggscatter)),
        diag = list(continuous = wrap(ggdehist))) + 
  theme_minimal() +
  theme(panel.grid = element_blank(),
        panel.border = element_rect(fill=NA),
        axis.text =  element_text(color='black'))+ 
  theme(text = element_text(size = 15,family = "myfont"))


