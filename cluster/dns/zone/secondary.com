$TTL 86400
$ORIGIN main.com.

@   IN  SOA ns1.main.com. master.main.com. (
        1       ; Serial (increment after each change)
        1d      ; Refresh (every 1 day)
        1h      ; Retry (retry after 1 hour)
        2w      ; Expire (expire after 2 weeks)
        1h      ; Minimum TTL (1 hour)
)

@           IN          A   127.0.0.11

@           IN          NS  ns1.main.com.
ns1         IN          A   127.0.0.11

@           IN          NS  ns2.main.com.
ns2         IN          A   127.0.0.11
