import os
from string import Template

# Generate conf/nutcracker.yml

target_port = os.environ['TARGET_PORT']
redis_host  = os.environ['REDIS_HOST']
redis_port  = os.environ.get('REDIS_PORT', 6379)
redis_db    = os.environ.get('REDIS_DB', 0)
redis_auth  = os.environ['REDIS_AUTH']

nutcracker_yml_tmpl = open('/usr/src/twemproxy/conf/templates/nutcracker.yml.tmpl', 'r').read()
nutcracker_yml_body = (
    Template(nutcracker_yml_tmpl)
    .substitute(
        target_port = target_port,
        redis_host = redis_host,
        redis_port = redis_port,
        redis_db = redis_db,
        redis_auth = redis_auth
    )
)
nutcracker_yml = open('/usr/src/twemproxy/conf/nutcracker.yml', 'w')
nutcracker_yml.write(nutcracker_yml_body)
nutcracker_yml.close()
