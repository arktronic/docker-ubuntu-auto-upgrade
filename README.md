# [docker-ubuntu-auto-upgrade](https://hub.docker.com/r/arktronic/ubuntu-auto-upgrade)

Ubuntu-based container with automatic upgrades via a Cron-scheduled script using [python-apt](https://salsa.debian.org/apt-team/python-apt)

The upgrade script kills PID 1 after any update is installed; therefore, an automatic restart policy is recommended.

A syslog daemon is installed as well. All facilities' messages are forwarded to the Docker log.

Get started:

```
docker run -d --init --restart=always arktronic/ubuntu-auto-upgrade
```

---

New with version 1.2: adding to or replacing the supervisord.conf file is supported.

Consider a file `/opt/things/config/supervisord.add.conf` with contents:

```
[program:cat]
command=/bin/cat /etc/hosts
startsecs=0
stdout_logfile=/dev/stdout
stdout_logfile_maxbytes=0
```

Given the above file, you can add the `cat` program to the existing supervisord.conf like so:

```
docker run -d --init --restart=always -v /opt/things/config:/conf arktronic/ubuntu-auto-upgrade
```

Alternatively, if you wish to override it altogether, use the filename `supervisord.replace.conf` instead of `supervisord.add.conf`.
