FROM rakudo-star:latest

RUN zef install --/test Crust
ENV PATH /usr/share/perl6/site/bin:$PATH

# If you need more files, consider making subdir and copy it instead.
WORKDIR /app/
COPY hello.p6w /app/
# XXX: zef install Crust sometimes install crustup.bat (NOT crustup!) as crustup and it does not work, therefore we copy REAL crustup
ADD https://github.com/tokuhirom/p6-Crust/raw/master/bin/crustup /app/
RUN chmod 755 crustup

EXPOSE 3000
ENTRYPOINT ["./crustup"]
CMD ["hello.p6w", "--host=0.0.0.0", "--port=3000"]
