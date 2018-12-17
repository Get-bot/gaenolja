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

  
DB 및 컨트롤 맵핑
----------------

### DB구조
 ![db](https://user-images.githubusercontent.com/40861712/50090955-5008c480-024d-11e9-98d3-20128be35980.png)

### DB구조 상세
  
   + 분양하시개   
 ![parcel](https://user-images.githubusercontent.com/40861712/50091339-73803f00-024e-11e9-8118-8bbd90052690.png)

   + 분양하시개 - 댓글
 ![parcel-comment](https://user-images.githubusercontent.com/40861712/50091373-8b57c300-024e-11e9-85fd-9089c0d34d25.png)

   + 개병원
 ![hospital](https://user-images.githubusercontent.com/40861712/50091441-c6f28d00-024e-11e9-8a8e-774018c000cf.png)

### 컨트롤러 맵핑
  
   + 분양하시개
 ![controller-parcel](https://user-images.githubusercontent.com/40861712/50091541-028d5700-024f-11e9-97ec-24ed25dc2967.png)

   + 개병
 ![controller-hospital](https://user-images.githubusercontent.com/40861712/50091570-13d66380-024f-11e9-8f18-b769ede26a8b.png)

   + 마이페이지 - 내 정보수정
 ![controller-mypage](https://user-images.githubusercontent.com/40861712/50091590-23ee4300-024f-11e9-9ac0-6bc933c11fba.png)

   + 마이페이지 - 게시글 모음
 ![controller-mypage2](https://user-images.githubusercontent.com/40861712/50091631-3ff1e480-024f-11e9-8107-16d592115b74.png)


보완점 및 후기
-------------

 #### 보완점
  + 페이징 처리 개념의 숙지가 아직 되지 않아 이전 & 이후의 처리가 되지 않고 페이징 블록이 무한히 늘어나는 문제.
  + 댓글 처리를 Ajax로 진행을 했는데 DB에 저장 하는 부분이나 화면에 출력하는 부분에서 발생되는 문제.
   (form-submit으로 처리 했으면 좀 더 좋지 않았을까 합니다.)
  + 동물병원 들을 지도 API에 있는 클러스터러로 처리 했는데 처리 후 아무런 이벤트 처리를 하지 못한 부분이 아쉽다.
  + 마이페이지에 존재하는 내 게시글, 내 댓글의 화면 처리가 보기 좋지 않은 문제.

 #### 후기
  + 이번 프로젝트를 진행 하면서 다시 한번 실력이 많이 부족한 점을 느꼈습니다. 전혀 생각지도 못한 페이징 처리 하는 기법이나
   다른 공공데이터를 가져와 변환시키는 작업의 어려움 등의 막히는 부분이 많았습니다. 하지만 미숙하지만 하나하나 처리를 
   하면서 알지 못했던 부분, 알고만 있었던 부분들을 다시 한번 짚어 보면서 다시 한번 배우는 기회였습니다.
   또한, 전혀 알지 못했던 자바라는 언어를 배우고, 직접 작성 하고, 결과물을 보면서 신기한 느낌을 많이 받았습니다.
   그냥 항상 결과물만 봐왔고 사용해 왔던 제가 이제 그 결과물을 만들고 전파 할 수 있다는 점이 좋았습니다.
   아직은 많이 부족한 실력이지만 더욱 많이 배우고 공부하면서 스스로도 만족하고 주변에서도 만족하실 수 있는 개발자가 되겠습니다.

 
