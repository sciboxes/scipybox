{% set home = pillar['home'] %}
{% set user = pillar['user'] %}

include:
  - python

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

virtualenv:
  pip.installed:
    - require:
      - pkg: python-pip

base_virtualenv:
  virtualenv.managed:
    - name: {{ home }}/env/
    - user: {{ user }}
    - no_chown: True
    - cwd: /home/vagrant/
    - system_site_packages: False
    - requirements: {{ pillar['req_dir'] }}/requirements.txt
    - require:
      - pip: virtualenv
