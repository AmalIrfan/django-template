# Django Template

Simple template for prototyping Django projects.

---

**Download**

```sh
$ git clone https://github.com/AmalIrfan/django-template
$ cd django-template
```

**Setup Venv**

```sh
$ python3 -m venv venv
$ . venv/bin/activate
(venv) $ pip install -r requirements.txt
```

**Create Secret File: '.env'**

```sh
$ cat > .env <<EOF
ALLOWED_HOSTS=*
SECRET_KEY=django-insecure-b!+y(8mb_t-=x*w=vm!ufw)f23vljvbv)$4ho4o#f+r!k#jja=
DEBUG=True
EOF
```

**Ready Sqlite and Staticfiles**

```sh
(venv) $ ./manage.py migrate
(venv) $ ./manage.py collectstatic
```

### Run Server

```sh
(venv) $ ./manage.py runserver 0.0.0.0:8000
```

**Rename (Optional)**

```sh
$ ./rename.sh website "new_name"
```

**Find LAN IP address (Optional)**

```sh
$ hostname -I | cut -d' ' -f1
```

**Create Admin User (Optional)**

```sh
(venv) $ ./manage.py createsuperuser
