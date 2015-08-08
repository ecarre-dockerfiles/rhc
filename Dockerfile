FROM ecarre/rhc-install
MAINTAINER Emmanuel CARRE <emmanuel.b.carre@gmail.com>

ENTRYPOINT ["rhc"]

CMD ["help"]