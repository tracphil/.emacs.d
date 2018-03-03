.emacs.d
========

This is a mostley fire and forget repo.

``Inconsolata`` is availble for both Debian and Fedora so I have included it. I had rather the default font be ``Source Code Pro``, however, it is not available via Debian yet and I am just to lazy to install it manually. I am really digging `Hack <http://sourcefoundry.org/hack/>`_ so I included it in the dependancies for Debian.

You can install the ``Hack`` font in Debian via::

  apt install fonts-hack-ttf

If you are interested in using `Hack <http://sourcefoundry.org/hack/>`_ font in Fedora::

  dnf copr enable heliocastro/hack-fonts
  dnf install hack-fonts

Install Dependancies
--------------------

Fedora
``````

::

   dnf install aspell npm perl-Text-MultiMarkdown ruby python2-flake8 python3-flake8 \
               adobe-source-code-pro-fonts levien-inconsolata-fonts

Debian
``````

::

   aptitude install aspell nodejs libtext-multimarkdown-perl ruby flake8 python-flake8 \
                    python-jedi python3-jedi python3-flake8 fonts-hack-{otf,ttf,web} \
                    python-rope python3-rope python3-importmagic python-autopep8 \
                    python-yapf python3-yapf python-flake8 python3-flake8 elpa-py-autopep8 \
                    fonts-inconsolata

Other Dependancies
``````````````````

::

   gem install mdl
   npm install jsonlint -g
   pip install jedi flake8 importmagic autopep8 yapf

Clone Repository
----------------

::

   cd ~/
   rm -f ~/.emacs.d
   git clone git@github.com:tracphil/.emacs.d.git

Install modeline fonts
----------------------

The spaceline modeline uses icons and fonts from `all-the-icons.el <https://github.com/domtronn/all-the-icons.el>`_ so you need to run a command to install the fonts::

  M-x all-the-icons-install-fonts

Bear in mind, this will also run ``fc-cache -f -v`` on MacOS and Linux which can take
some time to complete. For Windows, this function will prompt for a download
directory for you to install them manually.
