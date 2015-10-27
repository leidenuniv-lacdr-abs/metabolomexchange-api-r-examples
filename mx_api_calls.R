# install.packages('rjson')
library('rjson')

# datasets
cat(length(fromJSON(file='http://api.metabolomexchange.org/datasets', method='C')) > 3) # expected output TRUE

# providers
cat(length(fromJSON(file='http://api.metabolomexchange.org/providers', method='C')) > 1) # expected output TRUE

mtbls <- fromJSON(file='http://api.metabolomexchange.org/provider/mtbls', method='C')
cat(mtbls$shortname == 'mtbls') # expected output TRUE
cat(mtbls$name == 'MetaboLights') # expected output TRUE
cat(mtbls$url == 'http://www.ebi.ac.uk/metabolights/') # expected output TRUE
cat(length(mtbls$datasets) > 1) # expected output TRUE

# test search (submitter)
submitterDatasets <- fromJSON(file='http://api.metabolomexchange.org/datasets/Daniel%20Jacob', method='C')
for (submitterDataset in submitterDatasets){ cat(submitterDataset$submitter == 'Daniel Jacob') } # expected 10xTRUE

# test unique dataset call
datasetMTBLS34 <- fromJSON(file='http://api.metabolomexchange.org/dataset/mtbls/MTBLS34', method='C')
cat(datasetMTBLS34$accession == 'MTBLS34') # expected output TRUE
