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
    - name: /home/vagrant/env/
    - user: vagrant
    - no_chown: True
    - cwd: /home/vagrant/
    - system_site_packages: False
    - requirements: /vagrant/requirements.txt
    - verbose: True
    - require:
      - pip: virtualenv
