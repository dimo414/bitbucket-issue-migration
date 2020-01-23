FROM debian:testing

# Install dependencies
RUN \
  apt-get update && \
  apt-get install -y git python3-pip python3-venv && \
  pip3 install keyring && \
  git clone git://github.com/psf/requests.git && \
  cd requests && \
  pip3 install .

# Install bitbucket-issue-migration
RUN git clone https://github.com/jeffwidman/bitbucket-issue-migration.git && \
  cd bitbucket-issue-migration && \
  pip3 install -r requirements.pip

# Configure entrypoint for executable container
ENTRYPOINT ["python3", "bitbucket-issue-migration/migrate.py"]
CMD ["-h"]
