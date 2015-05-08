# install.packages('rjson')
library('rjson')

# test calls to MX JSON API (V1)

# Limit
cat(length(fromJSON(file='http://metabolomexchange.org/api/dataset/?limit=3&sort=asc', method='C')) == 3) # expected output TRUE
cat(length(fromJSON(file='http://metabolomexchange.org/api/dataset/?limit=5&sort=asc', method='C')) == 5) # expected output TRUE

# sortby and sort#
sortByDatasets <- fromJSON(file='http://metabolomexchange.org/api/dataset/?limit=10&sortby=date&sort=asc', method='C')
datesFromAPI <- c()
for (sortByDataset in sortByDatasets){ datesFromAPI <- c(datesFromAPI, sortByDataset$date) }
cat(datesFromAPI == sort(datesFromAPI, decreasing = FALSE)) # expected output == 10xTRUE

# test search (submitter)
submitterDatasets <- fromJSON(file='http://metabolomexchange.org/api/dataset/search/submitter/Diego Sanchez', method='C')
for (submitterDataset in submitterDatasets){ cat(submitterDataset$submitter == 'Diego Sanchez') } # expected 10xTRUE

# test unique dataset call
datasetMTBLS3 <- fromJSON(file='http://metabolomexchange.org/api/dataset/provider/MetaboLights/accession/MTBLS3/', method='C')
cat(datasetMTBLS3$accession == 'MTBLS3') # expected output TRUE
