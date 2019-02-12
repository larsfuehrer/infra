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
$ tf.sh -e do -c init
```

```
$ tf.sh -e do -c apply
```

# ToDo
- use TF or use/try https://kr8.rocks/ (see https://leebriggs.co.uk/blog/2019/02/07/why-are-we-templating-yaml.html)
