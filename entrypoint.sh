#! /bin/bash
while ! nc -z mysql 3306 ; do
    echo "Waiting for the MySQL Server"
    sleep 3
done

# Collect static files
echo "Collect static files"
python manage.py collectstatic --noinput

# Apply database migrations
echo "Apply database migrations"
python manage.py makemigrations

# Apply database migrate
echo "Apply database migrate"
python manage.py migrate

# Start server
echo "Starting server"
uwsgi -d --ini uwsgi/uwsgi.ini

# End script
echo "End script"

tail -f /dev/null

exec "$@"