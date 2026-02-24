data <- read.csv("data/processed/vivienda_clean.csv", stringsAsFactors = FALSE)
# Ver estructura
str(data)


# ---- 3. Correlaciones con variable objetivo ----
correlacion_con_objetivo <- function(data, objetivo) {
  
  if (!objetivo %in% colnames(data)) {
    stop("La variable objetivo no existe en el dataset")
  }
  
  numericas <- data[, sapply(data, is.numeric)]
  corrs <- cor(numericas, use = "complete.obs")
  
  return(corrs[, objetivo])
}

