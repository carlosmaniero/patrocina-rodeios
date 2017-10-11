# Patrocina Rodeios

[![Build Status](https://travis-ci.org/carlosmaniero/patrocina-rodeios.svg?branch=master)](https://travis-ci.org/carlosmaniero/patrocina-rodeios)

Listagem de empresas que estão envolvidas no patrocínio de rodeios.

# Desenvolvimento

Essa é uma aplicação desenvolvida usando Elm.

## Instalando o Elm

    npm install -g elm elm-live

# Baixando dependências

    elm-package install

## Executando

    elm-live --output=elm.js src/Main.elm --pushstate --open --debug

## Testando

Para executar os testes é necessário baixar as dependências da pasta `test`

    cd tests
    elm-package install

Em seguida executar o comando:

    elm-test
