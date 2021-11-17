# Integracja z PhpStorm

Settings > PHP > Quality Tools

Wybieramy toola:

  Configuration likamy w [...]

  Nowy interpreter (plus po lewej)

    Jeżeli nie ma to Nowy ClI Interpreter (plus po lewej)

      Image name: php-tools:lastest > OK

    Wybieramy php-tools jako interpreter

    W tool path ustawiamy: /usr/local/bin/[tool]  tool = [phpcs, phpmd, psalm, phpstan, php-cs-fixer]

    Validate

Do działania psalm wymagany jest plik konfiguracyjny psalm.xml w katalogu głównym projektu

`<?xml version="1.0"?>
<psalm>
    <projectFiles>
        <directory name="src"/>
    </projectFiles>
</psalm>`