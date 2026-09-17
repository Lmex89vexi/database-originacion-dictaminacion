# AGENTS.md

## What this repo is
Reference/schema repository, not an application. It holds MariaDB/MySQL schema dumps, one SQL file per database/service.
Only content today: `solicitud/solicitud.sql` — full DDL dump of the production `vexi_originacion` database
(AWS RDS, `MariaDB 10.6.25`, host `solicitud-prod.csvvfyniv8us.us-east-1.rds.amazonaws.com`).

- No build, test, lint, package manager, CI, or code. Do not look for `package.json`/`Makefile`.
- The dump is **schema only**: zero `INSERT`/`COPY` statements and no `CREATE DATABASE`/`USE`.
- `solicitud/solicitud.sql` is the single source of truth; edit it in place, don't split or rename.

## CodeGraph note
`.codegraph/` exists but indexes **0 files** (SQL is unsupported). `codegraph explore` returns
"No relevant code found" for everything here — use `rg` + Read directly.

## Contents of `solicitud/solicitud.sql` (~4010 lines)
- 115 `CREATE TABLE`, 49 views, 1 stored procedure (`sp_poblar_valores`), 126 FKs, all engines `InnoDB`.
- Table naming: `cat_*` catalogs, `ctl_*` control/state, `tbl_*` transactional, `tmp_*` one-off scratch
  (e.g. `tmp_corrige_producto`), `*_bkp` backups (e.g. `tbl_workflow_bkp`).
- Views are `vw_*`, almost entirely analytics dashboards (`vw_tablero_*`, `vw_analisis_*`) over
  `tbl_estatus_solicitud_hist`; plus `tbl_workflow_vw`.

## Domain model (originación + dictaminación)
- `tbl_solicitud` is the hub (34 FKs reference it); `tbl_prospecto` is the applicant.
  Solicitud↔prospecto link: `tbl_solicitud_prospecto`; per-solicitud children include `tbl_documento`,
  `tbl_credito_solicitud`, `tbl_random_digit`, `tbl_prospecto_telefono`.
- Dictamination/approval flow: `tbl_workflow` + `tbl_workflow_version` (JSON screen sequence, `CHECK json_valid`),
  `cat_fase_solicitud`, `cat_estatus_solicitud`, `tbl_estatus_solicitud_hist`, `cat_flujo`.
- Credit/bureau: `tbl_bc_score`, `tbl_cc_score`; verification: `tbl_log_validacion_gobierno`, `tbl_comparacion_rostro`,
  `tbl_incode_flow` (Incode identity SDK).

## Importing / dump quirks (would trip tooling)
- Import requires a pre-created target DB; the file has **no `CREATE DATABASE` and no `DROP TABLE`**, so importing
  into a non-empty schema collides with existing tables.
  e.g. `mysql -u root -p your_db < solicitud/solicitud.sql`.
- MariaDB executable comments: `/*!40101 ... */`, `/*!50001 ... */`, and `/*M!100301 COMPRESSED*/` on compressed
  `longtext` columns. Naive SQL parsers/linters may choke.
- `sp_poblar_valores` is delimited with `DELIMITER ;; ... DELIMITER ;` — statement splitters that only honor `;` break on it.
- Dump was taken with `FOREIGN_KEY_CHECKS=0`, `UNIQUE_CHECKS=0`, `SQL_MODE='NO_AUTO_VALUE_ON_ZERO'`.
- Charset `utf8mb4`; collation `utf8mb4_unicode_ci` except 11 `utf8mb4_general_ci` tables; JSON/binary columns use `utf8mb4_bin`.
- 106 tables carry live `AUTO_INCREMENT=` values (real production sequence positions).

## Git
Branch `main`, no commits yet. Remote: `github.com:Lmex89vexi/database-originacion-dictaminacion`.
