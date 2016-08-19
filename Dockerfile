FROM ecarre/rhc-install:1.1.1-proxytunnel
MAINTAINER Emmanuel CARRE <emmanuel.b.carre@gmail.com>

ENTRYPOINT ["rhc"]

CMD ["help"]
