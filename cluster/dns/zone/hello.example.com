$TTL 1d
$ORIGIN example.com.

@ IN  SOA   ns1 root (
      1     ;Serial
      1d    ;Refresh
      1h    ;Retry
      1w    ;Expire
      1h    ;Minimum
  )

@      IN     A       127.0.0.1

@      IN     NS      ns1
ns1    IN     A       127.0.0.1

@       IN    NS      ns2.example.com.
ns2     IN    A       172.17.0.3

