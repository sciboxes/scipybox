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

scipy:
  pip.installed:
    - name: scipy==0.15.1
    - user: vagrant
    - cwd: /home/vagrant/
    - bin_env: /home/vagrant/env/
    - verbose: True
    - require:
      - virtualenv: base_virtualenv
      - pkg: libfreetype6-dev
      - pkg: pkg-config
      - pkg: libblas-dev
      - pkg: liblapack-dev
      - pkg: gfortran
