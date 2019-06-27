# docker-ubuntu-auto-upgrade

Ubuntu-based container with automatic upgrades via a Cron-scheduled script using [python-apt](https://salsa.debian.org/apt-team/python-apt)

The upgrade script kills PID 1 after any update is installed; therefore, an automatic restart policy is recommended.

A syslog daemon is installed as well. All facilities' messages are forwarded to the Docker log.

Get started:

```
docker run -d --init --restart=always arktronic/ubuntu-auto-upgrade
```
