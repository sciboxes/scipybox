build-essential:
  pkg:
    - installed

python:
  pkg:
    - installed

python-pip:
  pkg:
   - installed

python-dev:
  pkg:
    - installed

bashrc:
  file.append:
    - name: /home/vagrant/.bashrc
    - text: |

        # cache pip-installed packages to avoid re-downloading
        export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
