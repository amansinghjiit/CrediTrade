# Exit on error
set -o errexit

pip install -r requirements.txt

python manage.py collectstatic --no-input

python manage.py migrate --run-syncdb

python manage.py shell <<EOF
from django.contrib.auth.models import User

if not User.objects.filter(username='amannick2').exists():
    User.objects.create_superuser('amannick2', 'amannick2@gmail.com', 'kibtypen')
EOF