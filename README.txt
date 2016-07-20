# SkAcademy


1일차

1h Architect overview 
1h In/out Data 공유 ( 비지니스 로직 포함 ) 
1h 아키텍쳐 설계 ( 조별 ) 

2h 아키텍쳐 리뷰 ( 발표 및 토론)
3H 개발환경 셋팅 
22


/skacademy/batch/data/meta/${table}                   // meta table
/skacademy/batch/data/in  /raw  /${table}/${YMD}      // interface 원본 파일
                          /clean/${table}/${YMD}      // interface Cleanging 파일

/skacademy/batch/data/dw  /history /${table}/p_${YMD} // 이력성 DW 파일
/skacademy/batch/data/dw  /original/${table}/         // 원부성 DW 파일 

/skacademy/batch/data/mart/${table}/p_${YMD}          // 데이터 마트 







