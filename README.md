Kraken
=======
Kraken es una aplicación para proporcionar una gestión de tareas basada en historial de usuario
para equipos de desarrollo ágiles.


Instalacion
------------
Primero necesitamos 

[prerequisites for running Ruby on Rails installed](http://rubyonrails.org/download)

Una vez que hayas pasado lo anterior:

    # Checkout the project
    $ https://github.com/Fabohack/krakenEP.git
    $ cd kraken

    # Install the project dependencies
    $ gem install bundler
    $ bundle install

    # Set up the development database
    $ bundle exec rake kraken:setup db:setup

    # Start the local web server
    $ rails server


Debes navegar a `http://localhost:3000/` en un navegadro web
Puedes ingresar al sistema con usuario `fjimenez@yachay.gob.ec`, password `12345678`.

