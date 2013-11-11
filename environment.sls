{%- if pillar.php.enabled %}

php_packages:
  pkg:
  - installed
  - names:
    - php5
    - php5-mysql
    - php5-pgsql
    - php5-gd
    - php5-curl
    - php5-intl
    - php5-xmlrpc
    - php5-mcrypt
    - php-pear
    - php5-dev
    - php5-memcache

{% if pillar.php.cache %}

{% if pillar.php.cache.engine == 'apc' %}

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

{%- endif %}
