FROM envoyproxy/envoy:v1.28-latest
COPY envoy.yaml /etc/envoy/envoy.yaml
RUN apt-get update && apt-get install -y curl
CMD ["/usr/local/bin/envoy", "-c", "/etc/envoy/envoy-config.yaml"]