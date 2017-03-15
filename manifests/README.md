# Processo para instalar o CodeSchool

* Execute os seguintes comandos para criar o ambiente virtual:

    ```sh
    echo "VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.bashrc
    echo "source `which virtualenvwrapper.sh`" >> ~/.bashrc
    source ~/.bashrc
    mkvirtualenv codeschool --python=/usr/bin/python3.6
    ```

* Entre dentro do ambiente virtual: ```workon codeschool```

* Execute os seguintes comandos dentro da pasta do projeto depois que entrar no ambiente virtual:

