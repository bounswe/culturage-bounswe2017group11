"""
WSGI config for culturage project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.11/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "culturage.settings")

sys.path.append('/var/www')
sys.path.append('/var/www/bounswe2017group11/backend/')

application = get_wsgi_application()
