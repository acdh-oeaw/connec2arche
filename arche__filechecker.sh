#/bin/bash
mv ./to_ingest/arche.ttl ./to_ingest/arche.txt
echo "run filechecker for for ${TOPCOLID}"
rm -rf ${PWD}/fc_out && mkdir ${PWD}/fc_out
docker run \
  --rm \
  --network="host" \
  -v ${PWD}/fc_out:/reports \
  -v ${PWD}/to_ingest:/data \
  --entrypoint arche-filechecker \
  acdhch/arche-ingest \
  --overwrite --skipWarnings --html /data /reports
mv ./to_ingest/arche.txt ./to_ingest/arche.ttl