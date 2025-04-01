FROM python:latest
WORKDIR /app

VOLUME [ "/app/content" ]
COPY Vault/ Vault/

RUN mkdir content_tmp/

RUN pip install obsidian_to_hugo

# This is very gimicky, but obsidian_to_hugo is removing `content/` directory
# This cannot be done as it is mounted
# Solution we create everything in `content_tmp` and then copy it over to `content`
ENTRYPOINT ["sh", "-c", "python -m obsidian_to_hugo --obsidian-vault-dir=Vault/ --hugo-content-dir=content_tmp/ && mv content_tmp/* content/" ]
# ENTRYPOINT [ "sleep", "10000" ]
