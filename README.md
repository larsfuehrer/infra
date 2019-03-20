### My Infra setup

## Requirements

# DigitalOcean - DOKS
- DigitalOcean account
- API Token from DigitalOcean

```
$ git clone https://github.com/pierknueppel/infra.git
```

```
$ cd infra
```

```
$ ./tf -e do -c init
```

```
$ ./tf -e do -c apply
```