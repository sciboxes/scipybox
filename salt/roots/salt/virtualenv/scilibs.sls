{% set home = pillar['home'] %}
{% set user = pillar['user'] %}

include:
  - virtualenv.base

scilibs:
  pip.installed:
    - requirements: {{ pillar['req_dir'] }}/requirements/scilibs.txt
    - no_chown: True
    - bin_env: {{ home }}/env/
    - user: {{ pillar['user'] }}
    - cwd: {{ home }}
    - require:
      - virtualenv: base_virtualenv
