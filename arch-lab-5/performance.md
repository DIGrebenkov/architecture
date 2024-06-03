### test with cache
```
Running 10s test @ http://localhost:8080
  10 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     0.96ms  447.81us   6.16ms   65.60%
    Req/Sec     1.05k    59.70     1.48k    75.82%
  Latency Distribution
     50%    0.95ms
     75%    1.08ms
     90%    1.54ms
     99%    2.36ms
  105975 requests in 10.10s, 26.43MB read
Requests/sec:  10494.20
Transfer/sec:      2.62MB
```

### test without cache
```
Running 10s test @ http://localhost:8080
  10 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.07ms  316.92us   9.83ms   76.53%
    Req/Sec     0.93k    36.80     1.04k    76.93%
  Latency Distribution
     50%    1.04ms
     75%    1.22ms
     90%    1.42ms
     99%    2.01ms
  93870 requests in 10.10s, 23.44MB read
Requests/sec:   9294.56
Transfer/sec:      2.32MB
```