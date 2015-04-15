{% set home = pillar['home'] %}
{% set user = pillar['user'] %}

include:
  - python

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
    - requirements: {{ pillar['req_dir'] }}/requirements/base.txt
    - require:
      - pip: virtualenv
