create or replace function listagg_clob( agg varchar2 )
return clob
parallel_enable aggregate using listagg_clob_t;
/

CREATE OR REPLACE FUNCTION listagg_clob_with_sep(
  p_val      VARCHAR2,
  p_separator VARCHAR2
) RETURN CLOB
IS
  l_raw_clob CLOB;
BEGIN
  -- call the aggregate with its normal single argument
  l_raw_clob := listagg_clob(p_val);
  -- replace the unique token with the requested separator
  RETURN REPLACE(l_raw_clob, '#####', p_separator);
END;
/
