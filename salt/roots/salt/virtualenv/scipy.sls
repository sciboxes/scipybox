{% set home = pillar['home'] %}
{% set user = pillar['user'] %}

include:
  - virtualenv.base

libblas-dev:
  pkg.installed

liblapack-dev:
  pkg.installed

gfortran:
  pkg.installed

virtualenv_scipy:
  pip.installed:
    - name: scipy
    - bin_env: {{ home }}/env/
    - user: {{ pillar['user'] }}
    - cwd: {{ home }}
    - require:
      - pip: virtualenv_pip
