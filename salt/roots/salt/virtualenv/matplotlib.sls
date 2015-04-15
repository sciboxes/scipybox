{% set home = pillar['home'] %}
{% set user = pillar['user'] %}

include:
  - virtualenv.base

libfreetype6-dev:
  pkg.installed

pkg-config:
  pkg.installed

virtualenv_matplotlib:
  pip.installed:
    - name: matplotlib
    - bin_env: {{ home }}/env/
    - user: {{ pillar['user'] }}
    - cwd: {{ home }}
    - require:
      - pip: virtualenv_pip
