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

virtualenv_scipy:
  pip.installed:
    - name: scipy
    - bin_env: {{ home }}/env/
    - user: {{ pillar['user'] }}
    - cwd: {{ home }}
    - require:
      - pip: virtualenv_pip

virtualenv_matplotlib:
  pip.installed:
    - name: matplotlib
    - bin_env: {{ home }}/env/
    - user: {{ pillar['user'] }}
    - cwd: {{ home }}
    - require:
      - pip: virtualenv_pip
