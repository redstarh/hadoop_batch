# SkAcademy

#### VM download #####

http://169.56.70.54/vm/








/skacademy/batch/data/meta/${table}                   // meta table
/skacademy/batch/data/in  /raw  /${table}/${YMD}      // interface 원본 파일
                          /clean/${table}/${YMD}      // interface Cleanging 파일

/skacademy/batch/data/dw  /history /${table}/p_${YMD} // 이력성 DW 파일
/skacademy/batch/data/dw  /original/${table}/         // 원부성 DW 파일 

/skacademy/batch/data/mart/${table}/p_${YMD}          // 데이터 마트 







