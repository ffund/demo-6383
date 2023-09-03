::: {.cell .markdown}
### Define configuration for this experiment
:::


::: {.cell .code}
```python
slice_name="exp-6383-" + fablib.get_bastion_username()
```
:::

::: {.cell .code}
```python
site_east = 'MASS'
site_west = 'UCSD'
site_mid_n = 'STAR'
site_mid_s = 'TACC'
```
:::

::: {.cell .code}
```python
node_conf = [
 {'name': "src", 'site': site_east, 'cores': 2, 'ram': 4, 'disk': 10, 'image': 'default_ubuntu_22', 'packages': []}, 
 {'name': "dst", 'site': site_west, 'cores': 2, 'ram': 4, 'disk': 10, 'image': 'default_ubuntu_22', 'packages': []}, 
 {'name': "rly0", 'site': site_mid_n, 'cores': 2, 'ram': 4, 'disk': 10, 'image': 'default_ubuntu_22', 'packages': []}, 
 {'name': "rly1", 'site': site_mid_s, 'cores': 2, 'ram': 4, 'disk': 10, 'image': 'default_ubuntu_22', 'packages': []}
]
net_conf = [
 {"name": "net-r0-s", "subnet": "10.0.0.0/24",   "nodes": [{"name": "src",  "addr": "10.0.0.100"}, {"name": "rly0", "addr": "10.0.0.1"}]},
 {"name": "net-r0-d", "subnet": "10.0.1.0/24",   "nodes": [{"name": "dst",  "addr": "10.0.1.101"}, {"name": "rly0", "addr": "10.0.1.1"}]},
 {"name": "net-r1-s", "subnet": "10.0.2.0/24",   "nodes": [{"name": "src",  "addr": "10.0.2.100"}, {"name": "rly1", "addr": "10.0.2.1"}]},
 {"name": "net-r1-d", "subnet": "10.0.3.0/24",   "nodes": [{"name": "dst",  "addr": "10.0.3.101"}, {"name": "rly1", "addr": "10.0.3.1"}]},
 {"name": "net-direct", "subnet": "10.0.4.0/24", "nodes": [{"name": "dst",  "addr": "10.0.4.101"}, {"name": "src",  "addr": "10.0.4.100"}]}
]
route_conf = [
 {"addr": "10.0.1.0/24", "gw": "10.0.0.1", "nodes": ["src"]}, 
 {"addr": "10.0.0.0/24", "gw": "10.0.1.1", "nodes": ["dst"]},
 {"addr": "10.0.3.0/24", "gw": "10.0.2.1", "nodes": ["src"]}, 
 {"addr": "10.0.2.0/24", "gw": "10.0.3.1", "nodes": ["dst"]}
]
```
:::

