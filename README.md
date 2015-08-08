# What is rhc

Rhc is a little binary really usefull when you work with openshift. You can find more information [here](https://developers.openshift.com/en/managing-common-rhc-commands.html)

# How to you use this image

The first step to use this image is create a data container. Rhc need to store some informations like your broker url or access to you ssh keys.

```bash
docker create -v /root/.openshift -v /root/.ssh --name rhc-data ecarre/rhc /bin/true  # Just for the first run. To create the container who store configuration.
```

The second step... use it:

```bash
docker run --rm -it --volumes-from rhc-data ecarre/rhc help
```

# Tips

## Aliases

It is useful to create an alias like this

```bash
alias rhc='docker run --rm -it --volumes-from rhc-data ecarre/rhc'
```

Or on Windows
```bash
doskey rhc=docker run --rm -it --volumes-from rhc-data ecarre/rhc $*
```

You will be able to use rhc container like this

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