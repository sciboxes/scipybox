{% set home = pillar['home'] %}
{% set user = pillar['user'] %}

include:
  - virtualenv.base

#### for matplotlib
libfreetype6-dev:
  pkg:
    - installed

pkg-config:
  pkg:
    - installed

### for scipy
libblas-dev:
  pkg:
    - installed

liblapack-dev:
  pkg:
    - installed

gfortran:
  pkg:
    - installed

virtualenv_scilibs:
  pip.installed:
    - requirements: {{ pillar['req_dir'] }}/requirements/scilibs.txt
    - no_chown: True
    - bin_env: {{ home }}/env/
    - user: {{ pillar['user'] }}
    - cwd: {{ home }}
    - require:
      - virtualenv: base_virtualenv
