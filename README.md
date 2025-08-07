# listagg_clob
extends listagg beyond its varchar2 limits

"Standard" LISTAGG takes varchar2 and returns a concatenation that may be longer than the limit of varchar2 which can be problematic.  LISTAGG_CLOB takes *varchar2* inputs and returns a clob to workaround the limitation of the *output* length.


## Installation Guide

```console
@@listagg_clob_t_ts.sql
@@listagg_clob_t_tb.sql
@@listagg_clob.sql
```

## Sample Usage

```console
SQL> select listagg_clob(owner)
  2  from dba_objects
  3  where rownum <= 10;

LISTAGG_CLOB(OWNER)
-----------------------------------------------
SYS,SYS,SYS,SYS,SYS,SYS,SYS,SYS,SYS,SYS

1 row selected.
```

```console
SQL> SELECT deptno,
2       listagg_clob_with_sep(ename, ' - ') AS employees
3 FROM   emp
4 GROUP  BY deptno;

employees
------------------------------------------------
SYS-SYS-SYS-SYS-SYS-SYS-SYS-SYS-SYS-SYS

1 row selected.
```
## Usual stuff

This software comes WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

Acknowledgements to the ground laying work by Anton Scheffer, via
https://technology.amis.nl/2015/03/13/using-an-aggregation-function-to-query-a-json-string-straight-from-sql/
