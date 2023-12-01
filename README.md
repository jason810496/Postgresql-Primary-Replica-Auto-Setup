# Postgresql Priamry-Replica Auto-Setup

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![DB : postgresql](https://img.shields.io/badge/DB-postgresql-blue.svg)](https://www.postgresql.org/)

<br>

![architecture](https://raw.githubusercontent.com/jason810496/Postgresql-Primary-Replica-Auto-Setup/main/docs/architecture.png)

<br>

Automate the configuration of a `primary-replica` architecture for `PostgreSQL` under `Docker Compose` using a `Makefile` and `shell` script.


## Demo

<a href="https://www.youtube.com/watch?v=es8I_ObKYNc&ab_channel=ZhuDev" target="_blank">
 <img src="https://raw.githubusercontent.com/jason810496/Postgresql-Primary-Replica-Auto-Setup/main/docs/demo.png" alt="demo" height="300" />
</a>

Click image to watch demo video on YouTube ☝️

## Usage
```bash
make primary-replica
# wait input of `pg_basebackup` command with `REPLICA_PASSWORD` password authentication input
```
> `REPLICA_PASSWORD` is the password of the `REPLICA_USER` user in the `primary` container. <br>
> `REPLICA_PASSWORD` can be set in the [`db.env`](#dbenv) file.

## Project Structure
```
.
├── Makefile
├── README.md
├── db_volumes
│   ├── primary
│   ├── primary_copy
│   └── replica
├── docker-compose.yml
└── primary-replica
    ├── db.env
    ├── pg_hba.conf
    ├── postgresql.conf
    ├── reset.sh
    ├── setup.sh
    └── test.sh

5 directories, 9 files
```
- `db.env` - Environment variables for the Docker Compose `env_file` directive and the `*.sh` scripts.
- `pg_hba.conf` 
    > PostgreSQL host-based authentication configuration file. <br>We use this to allow the `replica` to connect to the `primary`. <br> Will be copied to the `primary` container.
- `postgresql.conf` - PostgreSQL configuration file.
### `db.env`
```bash
POSTGRES_PASSWORD=postgresql_password
POSTGRES_USER=postgresql_user
POSTGRES_DB=postgresql_db

REPLICA_USER=repluser
REPLICA_PASSWORD=replpass
```

### `db_volumes`
- `primary` - PostgreSQL data directory for the `primary` container.
- `replica` - PostgreSQL data directory for the `replica` container.
- `primary_copy` - Volume for copying the `primary` data directory to the `replica` data directory.

## Requirements
- Docker Compose
- Make
- Bash

## References
- [twtrubiks : postgresql master slave video tutorial](https://www.youtube.com/watch?v=zxxzcpvCa6o&ab_channel=%E6%B2%88%E5%BC%98%E5%93%B2)
- [twtrubiks : postgresql note - master slave](https://github.com/twtrubiks/postgresql-note/tree/main/pg-master-slave)
- [editor.leonh.space : postgresql replication](https://editor.leonh.space/2023/postgresql-replication/)


## Issues & PR
Feel free to open an issue !

Pull requests are welcome. <br>
Any contributions you make are **greatly appreciated**.