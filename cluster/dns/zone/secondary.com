; BIND data file for local loopback interface
;
$TTL 86400
$ORIGIN secondary.com.

@   IN  SOA secondary.com. admin.secondary.com. (
        1       ; Serial (increment after each change)
        1d      ; Refresh (every 1 day)
        1h      ; Retry (retry after 1 hour)
        2w      ; Expire (expire after 2 weeks)
        1h      ; Minimum TTL (1 hour)
)

@       IN      NS      ns1.secondary.com.
@       IN      NS      ns2.secondary.com.
@       IN      A       172.20.0.11  ; Add this line
ns1     IN      A       172.20.0.11
ns2     IN      A       172.20.0.11  ; Add a second nameserver for redundancy
