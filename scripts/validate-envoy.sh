#!/bin/bash
docker run --rm -v $(pwd)/config:/config envoyproxy/envoy:v1.25-latest \
  envoy --mode validate -c /config/envoy.yaml