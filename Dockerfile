FROM rakudo-star:latest

RUN zef install --/test Crust
ENV PATH /usr/share/perl6/site/bin:$PATH

# If you need more files, consider making subdir and copy it instead.
WORKDIR /app/
COPY hello.p6w /app/
# XXX: zef install Crust sometimes install crustup.bat (NOT crustup!) as crustup and it does not work, therefore we copy REAL crustup
COPY crustup /app/

EXPOSE 5000
ENTRYPOINT ["./crustup"]
CMD ["hello.p6w", "--host=0.0.0.0", "--port=5000"]
