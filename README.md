# egovWebProject
전자정부 홈페이지(기본)

전자정부프레임워크 웹 템플릿기반
database : oralce/로컬호스트/orc0l - scott


DataBase function

/* 설문조사(RESEARCHSUB) FUNCTION */

-- scd를 구하는 함수

CREATE OR REPLACE function fn_setSCD
    return varchar2
is
    f_mcd number;
    m_scd varchar2(6);
    f_scd varchar2(6);
begin
    select max(mcd) into f_mcd from rschMain;
    dbms_output.put_line('f_mcd: ' || f_mcd);
    select max(scd) into m_scd from rschSub where scd like f_mcd || '%';
    dbms_output.put_line('m_scd: ' || m_scd);
    select NVL2(m_scd, max(m_scd)+1, f_mcd||'01') into f_scd from dual;
    return f_scd;
end;
/


DataBase Sequence

BOARDE1_SEQ /* BOARDE MAIN TABLE UNQ SEQUENCE */

BOARDE2_SEQ /* BOARDE COMMENT TABLE UNQ SEQUENCE */

DATABOARD_UNQ /* 자료실테이블 시퀀스*/

REBOARD_UNQ /* 댓글게시판(BOARD) 시퀀스*/

RSCH_UNQ /* 설문조사 시퀀스 */
