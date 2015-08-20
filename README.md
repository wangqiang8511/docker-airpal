# Presto Airpal

Simple docker images for airpal

# How to use

## Build Image

```bash
./build
```

## Config

Modify hack/set-default.sh.tmpl


## Run

```bash
# Migrate mysql db schema
hack/migrate_db.sh

# Start Airpal server
hack/start_server.sh
```

## Reference

[Airpal](https://github.com/airbnb/airpal)
