# Copy vault keys in a path

Copy vault keys from a path of a vault server to other path of same or different vault server.

```
docker run -e ORIGIN_TOKEN=origin_server_token \
           -e ORIGIN_SERVER=origin_server_url \
           -e ORIGIN_PATH=origin_path \
           -e DESTINATION_TOKEN=destination_server_token \
           -e DESTINATION_SERVER=destination_server_url \
           -e DESTINATION_PATH=destination_path jmferrer/vault-copy-path
```

Recursive copy is not supported.
