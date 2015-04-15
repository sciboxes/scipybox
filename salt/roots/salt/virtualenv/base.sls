{% set home = pillar['home'] %}
{% set user = pillar['user'] %}

include:
  - python

virtualenv:
  pip.installed:
    - require:
      - pkg: python-pip

create_virtualenv:
  virtualenv.managed:
    - name: {{ home }}/env/
    - user: {{ user }}
    - cwd: {{ home }}
    - system_site_packages: False
    - require:
      - pip: virtualenv

virtualenv_pip:
  pip.installed:
    - name: pip
    - bin_env: {{ home }}/env/
    - user: {{ pillar['user'] }}
    - cwd: {{ home }}
    - upgrade: True
    - require:
      - virtualenv: create_virtualenv

virtualenv_basics:
  pip.installed:
    - requirements: {{ pillar['req_dir'] }}/requirements/base.txt
    - bin_env: {{ home }}/env/
    - user: {{ pillar['user'] }}
    - cwd: {{ home }}
    - no_chown: True
    - require:
      - pip: virtualenv_pip
