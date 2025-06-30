#!/bin/bash

# Запускаем dbus
mkdir -p /run/dbus
dbus-daemon --system --fork

# Запускаем systemd
exec /usr/lib/systemd/systemd --log-level=info --log-target=console