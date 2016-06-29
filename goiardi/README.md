# Plan for Goiardi

[Goiardi](https://goiardi.gl/) is a pure golang implementation of Chef Server.

This plan aims to use the compiled binary of Goiardi, published on GitHub.

## Options

Most of the configurations are a 1:1 mapping of the original configuration file, but using underscores (`_`) instead of dashes (`-`). There are exceptions though: see `default.toml` for `[proxy]`, `[serf]`, `[mysql]`, and `[postgresql]`.

## Not tunable options

There are a couple of things you can't tune. You can find the reasons behind these decisions:

* **ipaddress**: My intent is to run it in a docker instance. No need to bind to specific interfaces.
* **port**: As above. Docker makes dynamic port connections somewhat difficult. Let's make it simple: port is 4646.
* **use-unsafe-mem-store**: while I understand it speeds things up in *dev mode*. Not an interesting option if you ask me.
* **conf-root**: it is `/data`. My intent is to run it in a docker instance, where all app-related data is in `/data`. So far so good.
* **data-file**, **index-file**, **local-filestore-dir**: they all store data under `/data`. Only when needed, of course.
* **use-ssl**, **ssl-cert**, and **ssl-key**: No SSL handling inside an app container. Frontends handle SSL termination.
* **log-file**, **syslog**: Applications log to stdout, which will be managed by docker, runit, upstart, systemd, whatever.
* **sign-priv-key**: Use habitat's file management. Upload the file `shovey.key` if you want it.
