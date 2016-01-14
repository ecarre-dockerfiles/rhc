FROM ecarre/rhc-install:1.0.0
MAINTAINER Emmanuel CARRE <emmanuel.b.carre@gmail.com>

ENTRYPOINT ["rhc"]

CMD ["help"]
