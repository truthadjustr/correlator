Usage
=====

This is based on **docker.elastic.co/logstash/logstash-oss:6.0.0** and containing below extra plugins:

* logstash-output-syslog
* logstash-output-gelf

I skipped to include **logstash-output-snmptrap** as this plugin is not mature yet.
Instead, I baked my own little Ruby snippet in the filter section.

Give it a test run:

```
docker run -it --rm truthadjustr/correlator
```

Then send a test message:

```
echo -n "test message" | socat -t 0 - udp:172.17.0.5:5140
```

Change the container ipaddr accordingly. The port is fixed at 5140.

You can pass in your custom logstash.conf file by:

```
docker run -it --rm -v /path/to/custom/logstash.conf:/usr/share/logstash/pipeline/logstash.conf truthadjustr/correlator
```

You can link the container port to your host by:

```
docker run -it --rm -p 14344:5140/udp truthadjustr/correlator
```

And then fire a test message to your localhost:
```
echo -n "test message" | socat -t 0 - udp:localhost:14344
```

**TIP: Do not forget the very important udp specifier when using -p, otherwise nothing goes through**


