********
scipybox
********

This repository provides the necessary files to provision a virtual machine
with a python virtual environment with numpy, scipy, matplotlib, ipython and
the required packages (jinja2, pyzmq, tornado) to run the ipython notebook.

At the time of this writing the box used is the official **Ubuntu Server 14.04
LTS (Trusty Tahr)** build as found at Vagrant Cloud at
https://vagrantcloud.com/ubuntu/trusty64.


.. contents::
   :local:


Prerequisites
=============

You should have recent versions of the following installed:

   * `vagrant <https://www.vagrantup.com/downloads.html>`_
   * `VirtualBox platform package <https://www.virtualbox.org/wiki/Downloads>`_
   * `VirtualBox Extension Pack <https://www.virtualbox.org/wiki/Downloads>`_

and the following vagrant plugins:

   * `cachier <https://github.com/fgrehm/vagrant-cachier>`__
   * `vbguest <https://github.com/dotless-de/vagrant-vbguest>`_

.. code-block:: bash

   $ vagrant plugin install vagrant-cachier vagrant-vbguest


.. _building-vm:

Building the virtual machine
============================

Run:

.. code-block:: bash

   $ vagrant up

**NOTE**: Especially if it is the first time you build the machine, it'll take
a while. (*Perhaps in between 10 to 15 minutes plus the time to download the
ubuntu image.*)


Connect:

.. code-block:: bash

   $ vagrant ssh


Python virtual environment
--------------------------

The box is provisioned to have a pre-built python virtual environment, named
``env`` under ``/home/vagrant``.

Active it

.. code-block:: bash

   vagrant@(...)~$ source env/bin/activate

The provisioning phase should also install the python packages listed under
``src/requirements.txt``. Consequently, if you run ``pip freeze`` you should
see the following packages:

* jinja2
* ipython
* matplotlib
* numpy
* pyzmq
* scipy
* tornado


Running the ipython notebook
""""""""""""""""""""""""""""
Before running the notebook, check the ip address of virtual machine. You can
run ``ifconfig`` to do so.

In the virtual environment run:

.. code-block:: bash

   (env)vagrant@(...)~$ ipython notebook --ip=0.0.0.0 --no-browser

You should then be able to access the notebook from the host machine at
http:/<box_ip>:8888


Vagrant tips
============

Using an automatic `vagrant bash completion`_, may be helpful to speed up your
work when using vagrant.

The first time you run ``vagrant up`` the box will be provisioned, but
afterwards it will not as this takes more time, and may not be needed. You can
instruct vagrant to provision the box like so:

.. code-block:: bash

   $ vagrant up --provision

If the box is already running then you can use the ``reload`` command like so:

.. code-block:: bash

   $ vagrant reload --provision


.. _vagrant bash completion: https://github.com/kura/vagrant-bash-completion
