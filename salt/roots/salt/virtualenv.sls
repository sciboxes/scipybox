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

scipy_virtualenv:
  virtualenv.managed:
    - name: /home/vagrant/env/
    - user: vagrant
    - no_chown: True
    - cwd: /home/vagrant/src
    - system_site_packages: False
    - requirements: /home/vagrant/src/requirements.txt
    - verbose: True
    - require:
      - pip: virtualenv
      - pkg: libfreetype6-dev
      - pkg: pkg-config
      - pkg: libblas-dev
      - pkg: liblapack-dev
      - pkg: gfortran
