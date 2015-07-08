# Rhc

Documentation in progress...

## How to you use this image

```bash
docker create -v /root/.openshift -v /root/.ssh --name rhc-data ecarre/rhc-install /bin/true  # Just for the first run. To create the container who store configuration.
docker run --rm -it --volumes-from rhc-data ecarre/rhc help
```

It is useful to create an alias like this

```bash
alias rhc='docker run --rm -it --volumes-from rhc-data ecarre/rhc'
```

You will be able to use container

```bash
$ rhc help
$ rhc servers
```

## Manage your data

Make a backup

```bash
docker run --rm -t -v "$(pwd)":/backup --volumes-from rhc-data --entrypoint=/usr/bin/zip --workdir="/backup" ecarre/rhc -r rhc-data-backup-$(date +%Y%m%d).zip /root/.openshift/ /root/.ssh
```

Make a restore

```bash
docker run --rm -t -v "$(pwd)":/backup --volumes-from rhc-data --entrypoint=/usr/bin/unzip --workdir="/" ecarre/rhc -o /backup/backup_name.zip
```