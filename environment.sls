{%- if pillar.php.environment.enabled %}

php_packages:
  pkg:
  - installed
  - names:
    - php5
    - php-pear
    {%- if pillar.php.environment.packages is defined %}
    {%- for package in pillar.php.environment.packages %}
    - php5-{{ package.name }}
    {%- endfor %}
    {%- else %}
    - php5-mysql
    - php5-pgsql
    - php5-gd
    - php5-curl
    - php5-intl
    - php5-xmlrpc
    - php5-mcrypt
    - php5-dev
    - php5-memcache
    {%- endif %}


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

{%- endif %}
