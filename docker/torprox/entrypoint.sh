#!/bin/sh
privoxy_run () {
  if [[ -e "/etc/privoxy/config" ]]; then
    /usr/sbin/privoxy --no-daemon /etc/privoxy/config &
  fi
}

tor_hupper () {
  /usr/bin/tor -f /etc/tor/torrc &
  sleep $(shuf -i 200-400 -n 1)
  killall -INT tor
}

privoxy_run
tor_hupper
