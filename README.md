# yugabyte-opensource

Yugabyte OpenSource Automation

```
            Yugabyte Cluster

        +----------------------+
        |  Master Leader       |
        |  10.0.0.10           |
        +----------+-----------+
                   |
      +------------+------------+
      |                         |
+-----+------+          +-------+------+
|  Node 2    |          |   Node 3     |
| 10.0.0.11  |          | 10.0.0.12    |
+------------+          +--------------+
```

```
[ DB VM 1 ] YugabyteDB
[ DB VM 2 ] YugabyteDB
[ DB VM 3 ] YugabyteDB

[ Monitoring VM ]
   ├── Docker:
   │     ├── Prometheus
   │     ├── Grafana
   │     └── Alertmanager

[ Bastion Host ]
   └── Secure Access (SSH / VPN)

[ NGINX ]
   └── HTTPS + Auth
```


| Component         | Port | Purpose                    |
| ----------------- | ---- | -------------------------- |
| Prometheus        | 9090 | Metrics collection & query |
| Grafana           | 3000 | Visualization dashboards   |
| Node Exporter     | 9100 | System metrics             |
| Blackbox Exporter | 9115 | Endpoint monitoring<br />  |

### Change Permission Of The PEM File.

```
chmod 600 ~/.ssh/id_rsa
```

```
          ┌──────────────────────┐
          │   Monitoring Node    │
          │   10.0.0.15          │
          │----------------------│
          │ Prometheus           │
          │ Grafana              │
          │ Alertmanager         │
          │ Blackbox             │
          └─────────┬────────────┘
                    │
     ┌──────────────┼──────────────┐
     │              │              │
┌──────────┐ ┌──────────┐ ┌──────────┐
│ node1    │ │ node2    │ │ node3    │
│ 10.0.0.10│ │ 10.0.0.11│ │ 10.0.0.12│
│----------│ │----------│ │----------│
│ Yugabyte │ │ Yugabyte │ │ Yugabyte │
│ Node Exp │ │ Node Exp │ │ Node Exp │
└──────────┘ └──────────┘ └──────────┘
```


```
                ┌────────────────────┐
                │   YugabyteDB       │
                │ (Masters + TServer)│
                └─────────┬──────────┘
                          │
        ┌─────────────────┼─────────────────┐
        │                                   │
        ▼                                   ▼
Native Metrics                     Postgres Exporter
(7000 / 9000)                     (9187)
        │                                   │
        └──────────────┬────────────────────┘
                       ▼
                 Prometheus
                       ▼
                   Grafana
```
