개놀자
======

프로젝트 개요 및 일정, 환경
-------------------------

 개요
  + 애견인들 간에 정보 및 소식들을 공유하면서 다양하게 즐길수 있는 웹 커뮤니티 사이트.

 개발일정
  + 일정 : 2018년 10월 23일 ~ 2018년 11월 11일
  + 참가인원 : 5명
  + 개발 담당업무 : 분양하시개(게시판), 마이페이지, 회원정보수정, 비밀번호수정, 개병원(개아파 카테고리 하위 게시판)

 개발환경
  + 언어 : JAVA, JavaScript, AJAX
  + DB : Oracle, MongoDB
  + FRAMEWORK : Spring, MyBatis
  + 사용오픈API : 카카오지도API, 다음 우편번호API, Open Weather Map API
  + 사용자료 : 지방행정인허가데이터(LOCALDATA) 동물병원 엑셀자료
  + 기타 : HTML, CSS, bootstrap

첨부
  + 사이트 URL : http://13.125.207.28
  + Github URL : https://github.com/rogemaster/gaenolja
  
***
구현서비스
----------

#### 개발 담당 서버스 소개
  1. 분양하시개 
![default](https://user-images.githubusercontent.com/40861712/48950402-5b364080-ef7e-11e8-8214-94534846ead4.png)

   + 게시물은 페이징 처리 하여 6개씩 불러오게 구현.
   + 주소API를 통해 선택된 주소를 지도API를 통해서 위도,경도를 출력해 DB 저장 및 추후 게시글 상세 화면에서 위치 표기 진행.
   + 상세 화면 댓글의 경우 Ajax 처리를 통해 DB 저장 하였고, 댓글DB와 회원정보DB를 join 하여 댓글 리스트를 구현.
   
 ***
  2. 개아파 -> 개병원
  
![default](https://user-images.githubusercontent.com/40861712/48951002-625e4e00-ef80-11e8-8b87-c1db76d7344e.png)
 
   + 지방행정인허가데이터(LOCALDATA)에서 서울 동물병원 자료를 받아 지도API를 통해 위도, 경도 값을 DB에 사전 저장.
   + 사전 저장된 위도, 경도 값을 지도API의 클러스터로 지도 구현.
   
 *** 
  3. 마이페이지(회원정보수정, 비밀번호수정)
 ![default](https://user-images.githubusercontent.com/40861712/48951431-e7963280-ef81-11e8-8a7f-7f0996396c49.png)
 
   + 회원정보수정에서 프로필 사진을 변경할 경우 Script를 통해 이미지 업로드와 동시에 화면 출력 구현.
   + 비밀번호의 경우 3가지의 값을 전부 입력 하지 않으면 수정 버튼이 비활성화 되도록 구현.
   
 ***
  4. 마이페이지(게시글 및 댓글 모음)
 ![default](https://user-images.githubusercontent.com/40861712/48951773-27a9e500-ef83-11e8-9138-818069d48f46.png)
 
   + 사용자 ID, NICKNAME 기준으로 DB에 존재하는 데이터 select 후 출력.
   + 게시글과 댓글의 경우 링크를 통해 해당 게시물로 바로 이동 가능.

  
