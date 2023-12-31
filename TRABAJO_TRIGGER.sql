---1---
/
DROP TABLE TARJETA_CLI;  --TABLA CON LA QUE SE VA A TRABAJAR
CREATE TABLE TARJETA_CLI
    AS (SELECT * FROM TARJETA_CLIENTE
        WHERE NRO_TARJETA=29320393064 OR NRO_TARJETA=28418181488);
/


CREATE OR REPLACE TRIGGER TRG_TARJETA_CLI1
    BEFORE INSERT ON TRANSACCION_TARJETA_CLIENTE
    FOR EACH ROW
    BEGIN
        IF :NEW.NRO_TARJETA=29320393064 THEN
            IF :NEW.COD_TPTRAN_TARJETA=103 THEN
                UPDATE TARJETA_CLI SET 
                    CUPO_DISP_SP_AVANCE=CUPO_DISP_SP_AVANCE-:NEW.MONTO_TOTAL_TRANSACCION
                WHERE NRO_TARJETA=29320393064;
            ELSE
                UPDATE TARJETA_CLI SET 
                    CUPO_DISP_COMPRA=CUPO_DISP_COMPRA-:NEW.MONTO_TOTAL_TRANSACCION
                WHERE NRO_TARJETA=29320393064;
            END IF;
        END IF;
    END;
/
--DROP TRIGGER TRG_TARJETA_CLI1;--
/
CREATE OR REPLACE TRIGGER TRG_TARJETA_CLI2
    BEFORE INSERT ON TRANSACCION_TARJETA_CLIENTE
    FOR EACH ROW
    BEGIN
        IF :NEW.NRO_TARJETA=28418181488 THEN
            IF :NEW.COD_TPTRAN_TARJETA=103 THEN
                UPDATE TARJETA_CLI SET 
                    CUPO_DISP_SP_AVANCE=CUPO_DISP_SP_AVANCE-:NEW.MONTO_TOTAL_TRANSACCION
                WHERE NRO_TARJETA=28418181488;
            ELSE 
                UPDATE TARJETA_CLI SET 
                    CUPO_DISP_COMPRA=CUPO_DISP_COMPRA-:NEW.MONTO_TOTAL_TRANSACCION
                WHERE NRO_TARJETA=28418181488;
            END IF;
        END IF;
    END;    
/
/**
DELETE FROM TRANSACCION_TARJETA_CLIENTE WHERE NRO_TARJETA=29320393064 OR 
NRO_TARJETA=28418181488;
**/
VAR b_fecha_ANNO VARCHAR2;
EXEC :b_fecha_ANNO:=TO_CHAR(EXTRACT(YEAR FROM SYSDATE));
INSERT INTO TRANSACCION_TARJETA_CLIENTE(NRO_TARJETA,
    NRO_TRANSACCION ,
    FECHA_TRANSACCION, 
    MONTO_TRANSACCION ,
    TOTAL_CUOTAS_TRANSACCION, 
    MONTO_TOTAL_TRANSACCION ,
    COD_TPTRAN_TARJETA)
VALUES (29320393064,1001,'04/05/'|| :b_fecha_ANNO
,800000,24,845000,101);
--
VAR b_fecha_ANNO VARCHAR2;
EXEC :b_fecha_ANNO:=TO_CHAR(EXTRACT(YEAR FROM SYSDATE));
INSERT INTO TRANSACCION_TARJETA_CLIENTE(NRO_TARJETA,
    NRO_TRANSACCION ,
    FECHA_TRANSACCION, 
    MONTO_TRANSACCION ,
    TOTAL_CUOTAS_TRANSACCION, 
    MONTO_TOTAL_TRANSACCION ,
    COD_TPTRAN_TARJETA)
VALUES (29320393064,1002,'25/05/'|| :b_fecha_ANNO
,86500,6,90325,101);
--
VAR b_fecha_ANNO VARCHAR2;
EXEC :b_fecha_ANNO:=TO_CHAR(EXTRACT(YEAR FROM SYSDATE));
INSERT INTO TRANSACCION_TARJETA_CLIENTE(NRO_TARJETA,
    NRO_TRANSACCION ,
    FECHA_TRANSACCION, 
    MONTO_TRANSACCION ,
    TOTAL_CUOTAS_TRANSACCION, 
    MONTO_TOTAL_TRANSACCION ,
    COD_TPTRAN_TARJETA)
VALUES (29320393064,1003,'25/05/'|| :b_fecha_ANNO
,485900,12,544490,103);
--
VAR b_fecha_ANNO VARCHAR2;
EXEC :b_fecha_ANNO:=TO_CHAR(EXTRACT(YEAR FROM SYSDATE));
INSERT INTO TRANSACCION_TARJETA_CLIENTE(NRO_TARJETA,
    NRO_TRANSACCION ,
    FECHA_TRANSACCION, 
    MONTO_TRANSACCION ,
    TOTAL_CUOTAS_TRANSACCION, 
    MONTO_TOTAL_TRANSACCION ,
    COD_TPTRAN_TARJETA)
VALUES (28418181488,1002,'15/05/'|| :b_fecha_ANNO
,200000,10,215000,101);
