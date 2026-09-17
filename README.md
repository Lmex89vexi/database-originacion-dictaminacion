# database-originacion-dictaminacion

Reference repository for the `vexi_originacion` database — the originación and
dictaminación (loan application + credit approval) schema.

Not an application: there is no build, test, lint, package manager, or CI. This
repo holds MariaDB/MySQL schema dumps, one SQL file per database/service.

## Contents

| Path | Database | Description |
| --- | --- | --- |
| `solicitud/solicitud.sql` | `vexi_originacion` | Full schema dump (production, AWS RDS, MariaDB 10.6.25) |

`solicitud/solicitud.sql` (~4010 lines) contains **schema only** — no `INSERT`
data, no `CREATE DATABASE`, no `USE`, no `DROP TABLE`.

- 115 `CREATE TABLE`, 49 views, 1 stored procedure (`sp_poblar_valores`), 126 foreign keys.
- All tables `InnoDB`, charset `utf8mb4`.

## Importing

The dump has no `CREATE DATABASE` and no `DROP TABLE` statements, so create an
empty target database first:

```sh
mysql -u root -p -e "CREATE DATABASE vexi_originacion CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
mysql -u root -p vexi_originacion < solicitud/solicitud.sql
```

Importing into a non-empty schema collides with existing tables.

## Schema conventions

- `cat_*` — catalogs; `ctl_*` — control/state; `tbl_*` — transactional tables;
  `tmp_*` — one-off scratch tables; `*_bkp` — backups.
- `vw_*` — views, mostly analytics dashboards (`vw_tablero_*`, `vw_analisis_*`)
  over `tbl_estatus_solicitud_hist`; plus `tbl_workflow_vw`.

### Domain model

- `tbl_solicitud` is the hub (34 FKs reference it); `tbl_prospecto` is the applicant.
  The solicitud↔prospecto link is `tbl_solicitud_prospecto`.
- Dictamination flow: `tbl_workflow` + `tbl_workflow_version` (JSON screen sequence,
  `CHECK json_valid`), `cat_fase_solicitud`, `cat_estatus_solicitud`,
  `tbl_estatus_solicitud_hist`, `cat_flujo`.
- Credit/bureau: `tbl_bc_score`, `tbl_cc_score`. Verification: `tbl_log_validacion_gobierno`,
  `tbl_comparacion_rostro`, `tbl_incode_flow` (Incode identity SDK).

## Dump quirks

- MariaDB executable comments (`/*!40101 ... */`, `/*!50001 ... */`) and compressed
  `longtext` columns (`/*M!100301 COMPRESSED*/`). Naive SQL parsers may choke.
- `sp_poblar_valores` uses `DELIMITER ;; ... DELIMITER ;`, so splitters that only
  honor `;` break on it.
- Dumped with `FOREIGN_KEY_CHECKS=0`, `UNIQUE_CHECKS=0`, `SQL_MODE='NO_AUTO_VALUE_ON_ZERO'`.
- Collation `utf8mb4_unicode_ci` except 11 tables using `utf8mb4_general_ci`;
  JSON/binary columns use `utf8mb4_bin`.
- 106 tables carry live `AUTO_INCREMENT=` values (production sequence positions).

See `AGENTS.md` for agent-oriented notes.
