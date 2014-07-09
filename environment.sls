{%- from "php/map.jinja" import environment with context %}
{%- if environment.enabled %}

php_packages:
  pkg.installed:
  - names: {{ environment.pkgs }}

{%- if environment.development %}

php_devel_packages:
  pkg.installed:
  - names: {{ environemnt.dev_pkgs }}

{%- endif %}

{#
{%- if pillar.php.environment.cache is defined %}

{%- if pillar.php.environment.cache.engine == 'apc' %}

php_apc_packages:
  pkg:
  - installed
  - names:
    - php-apc
  - require:
    - pkg: php_packages

/etc/php5/apache2/conf.d/apc.ini:
  file:
  - managed
  - source: salt://php/conf/apc.ini
  - template: jinja
  - require:
    - pkg: php_apc_packages

{%- endif %}

{%- endif %}
#}

{%- endif %}
