#!/bin/bash
FILES=("E21" "E18")
URL=https://pmb.acdh.oeaw.ac.at/media/

for item in ${FILES[@]}
   do 
   rm to_ingest/${item}
   curl -X GET  "https://connec.openatlas.eu/api/0.4/cidoc_class/${item}?show=none&format=turtle&locale=en&limit=3" > to_ingest/${item}.ttl
done
