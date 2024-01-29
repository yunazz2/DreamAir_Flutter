# 프로젝트: DreamAir_Flutter
<p align="center"><img src="https://github.com/ybm1968/DreamAir/assets/132187402/2ec7629c-e5f7-4b0f-9c09-16b8ef20024b" style="" width="800" height="400"/></p>


## 목차
### 1. 프로젝트 개요
  - 프로젝트 주제
  - 주제 선정 배경
  - 기획 의도
  - 활용방안 및 기대효과
### 2. 프로젝트 구조
  - 주요 기능
  - Menu Structure
  - Project Structure
  - Flow Chart
### 3. 프로젝트 팀 구성 및 역할
### 4. 프로젝트 수행절차 및 방법
  - 수행 절차
  - 수행 방법
### 5. 프로젝트 수행 경과
  - 요구사항 정의서
  - 기능 정의서
  - ERD
  - 테이블 정의서
  - 화면 설계서
  - 프로젝트 실제 화면 UI
### 6. REST Architecture로 전환
  - 대표 컨트롤러 코드 비교 및 설명
### 7. 핵심기능 코드 리뷰
  - 기능 목표
  - QR코드 생성 및 처리과정
  - 개선 할 점
### 8. 자체 평가 의견
  - 개별 평가
  - 종합 평가

# 1. 프로젝트 개요
## 1-1. 프로젝트 주제
- 사용자 경험을 공유하고 항공권 구매가 가능한 여행 포털사이트 구축 프로젝트


## 1-2. 주제 선정 배경
<img src="https://github.com/ybm1968/DreamAir/assets/132187402/6d8b2073-83e3-4044-822f-ffe4e47f3f18" width="800" height="500"/>
<img src="https://github.com/ybm1968/DreamAir/assets/132187402/b8274ccf-506c-4085-9044-00309235ab4c" width="800" height="500"/>
<img src="https://github.com/ybm1968/DreamAir/assets/132187402/31a1b706-0bbb-40e5-9348-bab3251793c8" width="800" height="500"/>
<img src="https://github.com/ybm1968/DreamAir/assets/132187402/328617e6-0ac3-42cb-bb8a-e6846b87e18d" width="800" height="500"/>


## 1-3. 기획의도
### 기존 저가 항공사(LCC, Low Cost Carrier)의 문제점을 고려하여, 저렴한 항공권을 제공하지만 서비스 부문에서 체계적이고 다양하게 제공함으로써 사용자가 여행을 더 긍정적으로 경험하고 즐길 수 있도록 함
- 저가 항공사의 문제점 개선 : 합리적인 가격과 더불어 체계적인 서비스 제공
- 실시간 좌석 선택 : 사용자가 실시간으로 좌석 현황을 볼 수 있어 원하는 자리를 선점 할 수 있음 
- 사용자 편리성 제공 : QR 코드 탑승권 발행
- 풍요로운 여행 서비스 제공 : 출발지/도착지에 대한 날씨와 각 도시 관광 정보, 여행 가이드 제공

## 1-4. 활용 방안 및 기대효과
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EA%B0%9C%EC%9A%94/%ED%99%9C%EC%9A%A9%EB%B0%A9%EC%95%88%EB%B0%8F%EA%B8%B0%EB%8C%80%ED%9A%A8%EA%B3%BC.PNG" width="800" height="500"/>

# 2. 프로젝트 구조
## 2-1. 주요기능
- 사용자
  - 회원가입
  - 로그인/로그아웃
  - 마이페이지 
- 관리자
  - 로그인/로그아웃
  - 관리자 관리
  - 사용자 관리
  - 항공기/상품관리
  - 예매관리
  - 탑승권 관리 
- 에매 서비스
  - 항공권 조회/예매/결제
  - 공항 버스 조회/예매/결제
  - 탑승권 번호 및 QR코드 발행 
- 게시판
  - 사용자 여행 경험공유
  - 여행 정보 제공
  - 프로모션 정보 제공

## 2-2. Menu Structure
<details>
<summary><h3>Menu Structure 👆</h3></summary>
<div markdown="1">

<img src="https://github.com/ybm1968/DreamAir/assets/132187402/dafcbfb4-3ca5-49f6-b6e4-686476483415" width="900" height="600"/>
<img src="https://github.com/ybm1968/DreamAir/assets/132187402/c4738c3d-e8bf-4d28-b9f1-02808a2c6615" width="900" height="600"/>

</div>
</details>

## 2-3. Flow Chart
<details>
<summary><h3>Flow Chart 👆</h3></summary>
<div markdown="1">

<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EA%B5%AC%EC%A1%B0/image129.png" width="900" height="600"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EA%B5%AC%EC%A1%B0/image123.png" width="900" height="600"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EA%B5%AC%EC%A1%B0/image116.png" width="900" height="600"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EA%B5%AC%EC%A1%B0/image117.png" width="900" height="600"/>

</div>
</details>


# 3.프로젝트 팀 구성 및 역할
- 인원 : 3명
- 이유나(팀장)
  - 주요 담당 : 사용자
  - 프로젝트 설계 및 DB 구축, 회원가입/수정/탈퇴, 탑승권 조회/좌석 변경/환불, 실시간 좌석 선택 기능 구현, 스프링 시큐리티 적용
- 임성민(팀원)
  - 주요 담당 : 항공권 구매
  - 프로젝트 설계 및 DB 구축, 항공권 조회/선택/결제, 탑승객 정보 입력, 결제 전 선택한 항공권 정보 확인, 결제 API 연동
- 정슬기(팀원)
  - 주요 담당 : 관리자, 게시판
  - 프로젝트 설계 및 DB 구축, 상품/사용자/예매/탑승권 관리, 게시판 목록/등록/수정/삭제, 버스 예매 시스템, 디자인 구성

 
# 4. 프로젝트 수행절차 및 방법
## 4-1. 프로젝트 수행 절차
- 2024-01-12 ~ 2024-01-29
<img src="https://github.com/yunazz2/DreamAir_Flutter/blob/LSM/img/%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20%EA%B8%B0%EA%B0%84.png" width="900" height="500"/>



## 4-2. 수행 방법
- 사용 언어 
  + <img src="https://img.shields.io/badge/Java-007396?style=flat&logo=Java&logoColor=white"> <img src="https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=MySQL&logoColor=white"/> <img src="https://img.shields.io/badge/Dart-0175C2?style=flat&logo=Dart&logoColor=white"/>
- 프레임워크
  + <img src="https://img.shields.io/badge/springboot 2.7.17-6DB33F?style=flat&logo=springboot&logoColor=white"> <img src="https://img.shields.io/badge/springsecurity-6DB33F?style=flat&logo=springsecurity&logoColor=white"> <img src="https://img.shields.io/badge/MyBatis-6DB33F?style=flat&logo=MyBatis&logoColor=white"> <img src="https://img.shields.io/badge/Flutter-02569B?style=flat&logo=Flutter&logoColor=white">
- 개발도구 
  + <img src="https://img.shields.io/badge/openjdk 17-686767?style=flat&logo=openjdk&logoColor=black"/> <img src="https://img.shields.io/badge/visualstudiocode-007ACC?style=flat&logo=visualstudiocode&logoColor=white"/> <img src="https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=MySQL&logoColor=white"/>
- 라이브러리
  + <img src="https://img.shields.io/badge/Devtools-6DB33F?style=flat&logo=springboot&logoColor=white">
- 사용 DB : <img src="https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=MySQL&logoColor=white"/> 
- 참조 API : <img src="https://img.shields.io/badge/Iamport-007396?style=flat&logo=Iamport&logoColor=white"> <img src="https://img.shields.io/badge/Zxing-007396?style=flat&logo=Zxing&logoColor=white">
- 협업 Tools : <img src="https://img.shields.io/badge/trello-0052CC?style=flat&logo=trello&logoColor=white"/> <img src="https://img.shields.io/badge/github-181717?style=flat&logo=github&logoColor=white"/> <img src="https://img.shields.io/badge/GoogleDrive-4285F4?style=flat&logo=GoogleDrive&logoColor=white"/>

# 5. 프로젝트 수행 경과
## 5-1. 요구사항 정의서
<details>
<summary><h3>요구사항 정의서 👆</h3></summary>
<div markdown="1">
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%EC%9A%94%EA%B5%AC%EC%82%AC%ED%95%AD%20%EC%A0%95%EC%9D%98%EC%84%9C/%EC%9A%94%EA%B5%AC%EC%82%AC%ED%95%AD%EC%A0%95%EC%9D%98%EC%84%9C1.PNG" width="1000" height="700"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%EC%9A%94%EA%B5%AC%EC%82%AC%ED%95%AD%20%EC%A0%95%EC%9D%98%EC%84%9C/%EC%9A%94%EA%B5%AC%EC%82%AC%ED%95%AD%EC%A0%95%EC%9D%98%EC%84%9C2.PNG" width="1000" height="700"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%EC%9A%94%EA%B5%AC%EC%82%AC%ED%95%AD%20%EC%A0%95%EC%9D%98%EC%84%9C/%EC%9A%94%EA%B5%AC%EC%82%AC%ED%95%AD%EC%A0%95%EC%9D%98%EC%84%9C3.PNG" width="1000" height="600"/>

</div>
</details>

## 5-2. 기능 정의서
<details>
<summary><h3>기능 정의서 👆</h3></summary>
<div markdown="1">
<img src="https://github.com/ybm1968/DreamAir/assets/132187402/3b2071d0-13d4-4481-98fd-307c224d6272" width="1000" height="600"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%EA%B8%B0%EB%8A%A5%EC%A0%95%EC%9D%98%EC%84%9C/%EA%B8%B0%EB%8A%A5%EC%A0%95%EC%9D%98%EC%84%9C2.PNG" width="1000" height="600"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%EA%B8%B0%EB%8A%A5%EC%A0%95%EC%9D%98%EC%84%9C/%EA%B8%B0%EB%8A%A5%EC%A0%95%EC%9D%98%EC%84%9C3.PNG" width="1000" height="600"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%EA%B8%B0%EB%8A%A5%EC%A0%95%EC%9D%98%EC%84%9C/%EA%B8%B0%EB%8A%A5%EC%A0%95%EC%9D%98%EC%84%9C4.PNG" width="1000" height="600"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%EA%B8%B0%EB%8A%A5%EC%A0%95%EC%9D%98%EC%84%9C/%EA%B8%B0%EB%8A%A5%EC%A0%95%EC%9D%98%EC%84%9C5.PNG" width="1000" height="600"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%EA%B8%B0%EB%8A%A5%EC%A0%95%EC%9D%98%EC%84%9C/%EA%B8%B0%EB%8A%A5%EC%A0%95%EC%9D%98%EC%84%9C6.PNG" width="1000" height="600"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%EA%B8%B0%EB%8A%A5%EC%A0%95%EC%9D%98%EC%84%9C/%EA%B8%B0%EB%8A%A5%EC%A0%95%EC%9D%98%EC%84%9C7.PNG" width="1000" height="600"/>
  
</div>
</details>

## 5-3. ERD
<details>
<summary><h3>ERD 👆</h3></summary>
<div markdown="1">
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/ERD/%ED%95%AD%EA%B3%B5%EA%B6%8C%20%EC%98%88%EB%A7%A4%20(1).png" width="1000" height="800"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/ERD/erd4.PNG" width="1000" height="700"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/ERD/erd5.PNG" width="1000" height="700"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/ERD/erd2.PNG" width="1000" height="700"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/ERD/erd3.PNG" width="1000" height="700"/>

</div>
</details>

## 5-4. 테이블 정의서
<details>
<summary><h3>테이블 정의서 👆</h3></summary>
<div markdown="1">
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%ED%85%8C%EC%9D%B4%EB%B8%94%EC%A0%95%EC%9D%98%EC%84%9C/%ED%85%8C%EC%9D%B4%EB%B8%94%EC%A0%95%EC%9D%98%EC%84%9C1.PNG" width="1000" height="600"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%ED%85%8C%EC%9D%B4%EB%B8%94%EC%A0%95%EC%9D%98%EC%84%9C/%ED%85%8C%EC%9D%B4%EB%B8%94%EC%A0%95%EC%9D%98%EC%84%9C2.PNG" width="1000" height="600"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%ED%85%8C%EC%9D%B4%EB%B8%94%EC%A0%95%EC%9D%98%EC%84%9C/%ED%85%8C%EC%9D%B4%EB%B8%94%EC%A0%95%EC%9D%98%EC%84%9C3.PNG" width="1000" height="600"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%ED%85%8C%EC%9D%B4%EB%B8%94%EC%A0%95%EC%9D%98%EC%84%9C/%ED%85%8C%EC%9D%B4%EB%B8%94%EC%A0%95%EC%9D%98%EC%84%9C4.PNG" width="1000" height="600"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%ED%85%8C%EC%9D%B4%EB%B8%94%EC%A0%95%EC%9D%98%EC%84%9C/%ED%85%8C%EC%9D%B4%EB%B8%94%EC%A0%95%EC%9D%98%EC%84%9C5.PNG" width="1000" height="600"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%ED%85%8C%EC%9D%B4%EB%B8%94%EC%A0%95%EC%9D%98%EC%84%9C/%ED%85%8C%EC%9D%B4%EB%B8%94%EC%A0%95%EC%9D%98%EC%84%9C6.PNG" width="1000" height="600"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%ED%85%8C%EC%9D%B4%EB%B8%94%EC%A0%95%EC%9D%98%EC%84%9C/%ED%85%8C%EC%9D%B4%EB%B8%94%EC%A0%95%EC%9D%98%EC%84%9C7.PNG" width="1000" height="600"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%ED%85%8C%EC%9D%B4%EB%B8%94%EC%A0%95%EC%9D%98%EC%84%9C/%ED%85%8C%EC%9D%B4%EB%B8%94%EC%A0%95%EC%9D%98%EC%84%9C8.PNG" width="1000" height="600"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%ED%85%8C%EC%9D%B4%EB%B8%94%EC%A0%95%EC%9D%98%EC%84%9C/%ED%85%8C%EC%9D%B4%EB%B8%94%EC%A0%95%EC%9D%98%EC%84%9C9.PNG" width="1000" height="600"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%ED%85%8C%EC%9D%B4%EB%B8%94%EC%A0%95%EC%9D%98%EC%84%9C/%ED%85%8C%EC%9D%B4%EB%B8%94%EC%A0%95%EC%9D%98%EC%84%9C10.PNG" width="1000" height="600"/>
<img src="https://github.com/ybm1968/DreamAir/blob/LSM/img/%ED%85%8C%EC%9D%B4%EB%B8%94%EC%A0%95%EC%9D%98%EC%84%9C/%ED%85%8C%EC%9D%B4%EB%B8%94%EC%A0%95%EC%9D%98%EC%84%9C11.PNG" width="1000" height="600"/>

</div>
</details>

## 5-5. 화면 설계서
<details>
<summary><h3>사용자 👆</h3></summary>
<div markdown="1">
<img src="https://github.com/yunazz2/DreamAir_Flutter/blob/LSM/img/%EC%99%80%EC%9D%B4%EC%96%B4%ED%94%84%EB%A0%88%EC%9E%84/%EC%82%AC%EC%9A%A9%EC%9E%90/%EC%82%AC%EC%9A%A9%EC%9E%901.png" width="1000" height="600"/>
<img src="https://github.com/yunazz2/DreamAir_Flutter/blob/LSM/img/%EC%99%80%EC%9D%B4%EC%96%B4%ED%94%84%EB%A0%88%EC%9E%84/%EC%82%AC%EC%9A%A9%EC%9E%90/%EC%82%AC%EC%9A%A9%EC%9E%902.png" width="1000" height="600"/>
<img src="https://github.com/yunazz2/DreamAir_Flutter/blob/LSM/img/%EC%99%80%EC%9D%B4%EC%96%B4%ED%94%84%EB%A0%88%EC%9E%84/%EC%82%AC%EC%9A%A9%EC%9E%90/%EC%82%AC%EC%9A%A9%EC%9E%903.png" width="1000" height="600"/>
<img src="https://github.com/yunazz2/DreamAir_Flutter/blob/LSM/img/%EC%99%80%EC%9D%B4%EC%96%B4%ED%94%84%EB%A0%88%EC%9E%84/%EC%82%AC%EC%9A%A9%EC%9E%90/%EC%82%AC%EC%9A%A9%EC%9E%904.png" width="1000" height="600"/>
</div>
</details>

----

<details>
<summary><h3>예매 서비스 👆</h3></summary>
<div markdown="1">
<img src="https://github.com/yunazz2/DreamAir_Flutter/blob/LSM/img/%EC%99%80%EC%9D%B4%EC%96%B4%ED%94%84%EB%A0%88%EC%9E%84/%EC%98%88%EB%A7%A4/%EC%98%88%EB%A7%A41.png" width="1000" height="600"/>
<img src="https://github.com/yunazz2/DreamAir_Flutter/blob/LSM/img/%EC%99%80%EC%9D%B4%EC%96%B4%ED%94%84%EB%A0%88%EC%9E%84/%EC%98%88%EB%A7%A4/%EC%98%88%EB%A7%A42.png" width="1000" height="600"/>
</div>
</details>

----

<details>
<summary><h3>게시판 👆</h3></summary>
<div markdown="1">
<img src="https://github.com/yunazz2/DreamAir_Flutter/blob/LSM/img/%EC%99%80%EC%9D%B4%EC%96%B4%ED%94%84%EB%A0%88%EC%9E%84/%EA%B2%8C%EC%8B%9C%ED%8C%90/%EA%B2%8C%EC%8B%9C%ED%8C%901.png" width="1000" height="600"/>
<img src="https://github.com/yunazz2/DreamAir_Flutter/blob/LSM/img/%EC%99%80%EC%9D%B4%EC%96%B4%ED%94%84%EB%A0%88%EC%9E%84/%EA%B2%8C%EC%8B%9C%ED%8C%90/%EA%B2%8C%EC%8B%9C%ED%8C%902.png" width="1000" height="600"/>
</div>
</details>


----


## 5-6. 프로젝트 실제 화면 UI

<details>
<summary><h3>사용자 👆</h3></summary>
<div markdown="1">
<img src="https://github.com/yunazz2/DreamAir_Flutter/blob/LSM/img/%EC%8B%A4%EC%A0%9C%ED%99%94%EB%A9%B4/%EC%82%AC%EC%9A%A9%EC%9E%90/%EC%82%AC%EC%9A%A9%EC%9E%901.png" width="1000" height="600"/>
<img src="https://github.com/yunazz2/DreamAir_Flutter/blob/LSM/img/%EC%8B%A4%EC%A0%9C%ED%99%94%EB%A9%B4/%EC%82%AC%EC%9A%A9%EC%9E%90/%EC%82%AC%EC%9A%A9%EC%9E%902.png" width="1000" height="600"/>
<img src="https://github.com/yunazz2/DreamAir_Flutter/blob/LSM/img/%EC%8B%A4%EC%A0%9C%ED%99%94%EB%A9%B4/%EC%82%AC%EC%9A%A9%EC%9E%90/%EC%82%AC%EC%9A%A9%EC%9E%903.png" width="1000" height="600"/>
</div>
</details>

----

<details>
<summary><h3>예매 서비스 👆</h3></summary>
<div markdown="1">
<img src="https://github.com/yunazz2/DreamAir_Flutter/blob/LSM/img/%EC%8B%A4%EC%A0%9C%ED%99%94%EB%A9%B4/%EC%98%88%EB%A7%A4/%EC%98%88%EB%A7%A41.png" width="1000" height="600"/>
<img src="https://github.com/yunazz2/DreamAir_Flutter/blob/LSM/img/%EC%8B%A4%EC%A0%9C%ED%99%94%EB%A9%B4/%EC%98%88%EB%A7%A4/%EC%98%88%EB%A7%A42.png" width="1000" height="600"/>
<img src="https://github.com/yunazz2/DreamAir_Flutter/blob/LSM/img/%EC%8B%A4%EC%A0%9C%ED%99%94%EB%A9%B4/%EC%98%88%EB%A7%A4/%EC%98%88%EB%A7%A43.png" width="1000" height="600"/>
</div>
</details>

----

<details>
<summary><h3>게시판 👆</h3></summary>
<div markdown="1">
<img src="https://github.com/yunazz2/DreamAir_Flutter/blob/LSM/img/%EC%8B%A4%EC%A0%9C%ED%99%94%EB%A9%B4/%EA%B2%8C%EC%8B%9C%ED%8C%90/%EA%B2%8C%EC%8B%9C%ED%8C%901.png" width="1000" height="600"/>
</div>
</details>


----

# 6. REST Architecture로 전환
<details>
<summary><h3>대표 컨트롤러 코드 비교 및 설명 👆</h3></summary>
<div markdown="1">
<img src="https://github.com/yunazz2/DreamAir_React/blob/LSM/img/REST%20Architecture%EB%A1%9C%20%EC%A0%84%ED%99%98/%EC%BB%A8%ED%8A%B8%EB%A1%A4%EB%9F%AC1.png" width="1000" height="600"/>
<img src="https://github.com/yunazz2/DreamAir_React/blob/LSM/img/REST%20Architecture%EB%A1%9C%20%EC%A0%84%ED%99%98/%EC%BB%A8%ED%8A%B8%EB%A1%A4%EB%9F%AC2.png" width="1000" height="600"/>
<img src="https://github.com/yunazz2/DreamAir_React/blob/LSM/img/REST%20Architecture%EB%A1%9C%20%EC%A0%84%ED%99%98/%EC%BB%A8%ED%8A%B8%EB%A1%A4%EB%9F%AC3.png" width="1000" height="600"/>
<img src="https://github.com/yunazz2/DreamAir_React/blob/LSM/img/REST%20Architecture%EB%A1%9C%20%EC%A0%84%ED%99%98/%EC%BB%A8%ED%8A%B8%EB%A1%A4%EB%9F%AC4.png" width="1000" height="600"/>
<img src="https://github.com/yunazz2/DreamAir_React/blob/LSM/img/REST%20Architecture%EB%A1%9C%20%EC%A0%84%ED%99%98/%EC%BB%A8%ED%8A%B8%EB%A1%A4%EB%9F%AC5.png" width="1000" height="600"/>
<img src="https://github.com/yunazz2/DreamAir_React/blob/LSM/img/REST%20Architecture%EB%A1%9C%20%EC%A0%84%ED%99%98/%EC%BB%A8%ED%8A%B8%EB%A1%A4%EB%9F%AC6.png" width="1000" height="600"/>

</div>
</details>


# 7. 핵심기능 코드 리뷰
## 7-1. 기능목표
### 탑승권을 QR 코드의 형태로 제공하여 관리자가 편리하게 업무(사용자 탑승권 탑승 처리)를 볼 수 있도록 함
- 사용자의 종이 탑승권 분실 위험도 감소
- 탑승권 처리 시 해당 페이지로 자동 연결되므로 사용자 경험 개선
![캡처](https://github.com/ybm1968/DreamAir/assets/132187402/0361b8d7-2045-460a-a5b0-d1cc9f8d877b)


## 7-2. QR코드 생성 및 처리과정
### QR코드 생성 : 항공권 결제 완료 → 티켓 번호 발급 → QR 코드 생성
<details>
<summary><h3>QR코드 생성 👆</h3></summary>
<div markdown="1">


- QR 코드 등록을 위한 QRController.java 작성
  

```java
  // 등록
  @PostMapping()
    public ResponseEntity<?> create(@RequestBody QR qr) {
        log.info("[POST] - /qr - qr 등록");
        try {
            int result = qrService.insert(qr);
            if( result > 0 )
                return new ResponseEntity<>("qr 등록 완료", HttpStatus.CREATED);  // 201
            else
                return new ResponseEntity<>("qr 등록 실패", HttpStatus.OK);  

        } catch (Exception e) {
            log.error(null, e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
```


- 항공권 결제 완료 시, QR 코드 등록을 위한 BookingServiceImple.java 작성

```java
// 탑승권 번호 발행 + QR 코드 발행
    @Override
    public int createTicket(Booking booking, Principal principal, HttpServletRequest request) throws Exception {
        String userId = "";
        int result = 0;
        int bookingNo = 0;
        int ticketNo = 0;
        int count1 = 0;
        int count2 = 0;
        HttpSession session = request.getSession();
        userId = (String) session.getAttribute("userId");

        // ✅ TODO : 조건 passeungerCount 에 따라서 티켓(탑승권 번호) 발행 
        for (int i = 0; i < booking.getPasCount(); i++) {
								...
            }

        // ✅ QR 코드 생성   
            QR qr = new QR();
            qr.setParentTable("booking");
            qr.setParentNo(ticketNo);
            String url = "http://localhost:" + serverPort + "/admin/Final_check?ticketNo=" + ticketNo;
            qr.setUrl( url );
            qr.setName("QR_" + ticketNo);

            qrService.makeQR(qr);

            result += count;
        }
        return result;
    }
```


- QR 코드 생성 시, [관리자 페이지 - QR 코드 목록]에서 확인 가능
![qr1](https://github.com/ybm1968/DreamAir/assets/132187402/bec5d1ec-16ab-42d3-ab92-e31d9d004240)


</div>
</details>

----

### QR코드 처리 : QR 코드 인식 →  탑승권 처리 페이지로 연결 → 해당 티켓 번호에 대한 탑승권 조회 → 탑승 처리 완료 → QR 코드 삭제
<details>
<summary><h3>QR코드 처리 👆</h3></summary>
<div markdown="1">


 
- QR 코드 삭제를 위한 QRController 작성
  
 
```java
// 삭제
    @DeleteMapping("/{qrNo}")
    public ResponseEntity<?> destroy(@PathVariable Integer qrNo) {
        log.info("[DELETE] - /qr/" + qrNo + " - qr 삭제");
        try {
            int result = qrService.delete(qrNo);
            if( result > 0 )
                return new ResponseEntity<>("qr 삭제 완료", HttpStatus.OK); 
            else
                return new ResponseEntity<>("qr 삭제 실패", HttpStatus.OK);
        } catch (Exception e) {
            log.error(null, e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
```


- 항공권 결제 완료 시, QR 코드 등록을 위한 BookingServiceImple.java 작성

```java
// 탑승권 화면 - 탑승 최종 확인 위한
    @GetMapping("/Final_check/{ticketNo}")
    public ResponseEntity<?> getOne(@PathVariable Integer ticketNo) {
        log.info("[GET] - /admin/Final_check" + ticketNo + "탑승권 조회");  
        try {
            List<Booking> pasTicketList = adminService.pas_ticketList(ticketNo);
            if( pasTicketList == null )
                log.info("탑승권 목록 없음");
            else
                log.info("탑승권 수 : " + pasTicketList.size());

                Files files = new Files();
                files.setParentTable("booking");
                files.setParentNo(ticketNo);
                List<Files> fileList = fileService.listByParent(files);

                QR qr = new QR();
                qr.setParentTable("booking");
                qr.setParentNo(ticketNo);
                List<QR> qrList = qrService.listByParent(qr);

                Map<String, Object> result = new HashMap<String,Object>();
                result.put("qrList", qrList);
                result.put("fileList", fileList);
                result.put("pasTicketList", pasTicketList);

            return new ResponseEntity<>(result, HttpStatus.OK);
            
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
```


- QR 코드 인식 시, [관리자 페이지 - 탑승 처리]에서 탑승권 처리 가능
![qr2](https://github.com/ybm1968/DreamAir/assets/132187402/d9b34145-c9a5-48a1-8259-0bd11e7cd291)


</div>
</details>

----

## 7-3. 개선 할 점
- 추후 QR 코드를 사용자 버전과 관리자 버전으로 2개 생성하여 1) 사용자가 QR 코드를 인식 할 때 체크인 페이지로 이동하고, 2) 관리자가 QR 코드를 인식 할 때 탑승처리 페이지로 이동할 수 있도록 하여 보다 더 실제 항공사에서 사용하는 QR 코드 서비스처럼 구현하고자 함
  - QR 코드 1개에 1개의 URL 생성 가능함으로 2개를 생성하여 사용자 버전과 관리자 버전으로 구분하여 보다 제공되는 서비스 품질을 높일 수 있음



# 8. 자체 평가 의견
## 8-1. 개별 평가
- 이유나
  - Flutter는 다양한 위젯과 직관적인 문법으로 이루어져 있어 원하는 화면대로 위젯을 디자인하거나 배치하는 방법이 편리하다고 느껴졌습니다. UserProvider를 사용하여 User 객체를 관리하는 부분에서는 초기에 설정하고 관리하는 부분이 다소 어렵게 느껴졌으나, 앱 전반에서 정보를 효율적으로 공유할 수 있어 편리하다고 생각했습니다.
- 임성민
  - Flutter 를 처음 활용해서 프로젝트를 진행 했는데 기존에 웹에서 활용했던 HTML, CSS, JavaScript 보다 더 체계적인 언어라는 느낌이 들었다. 그리고 Provider를 활용해서 항공권 예매 과정에서 필요한 데이터를 관리 했는데 서버에서 받아온 데이터를 Provider에 바인딩하는 부분이 처음에 어떻게 해야할지 몰라서 어려웠다. 하지만 방법을 알고 나서는 데이터를 내가 원하는 화면에서 관리할 수 있어서 기존에 웹에서 데이터를 관리하는 것보다 편리했다.
- 정슬기
  - flutter는 위젯으로 UI를 구성 할 수 있어 편리하다는 장점이 있지만 상위 위젯과 하위 위젯 간에 호환되는 것에 대한 이해도가 높지 않아 Rendering 시에 Box Sized 에 대한 overflow가 발생하는 경우가 빈번했고, 이를 해결하는 것이 쉽지 않았습니다. 짧은 시간에 프로젝트를 구현해야해서 dart/flutter document에 대한 사전 공부없이 부딪힌 경우가 대부분이라 여건이 된다면 문서에 대한 이해를 차근차근 해보고 싶습니다.
 

## 8-2. 종합 평가

### 한계점
- Dart/Flutter라는 언어 특성 상 위젯을 사용해야해서 위젯에 대한 정의나 개념이 잘 잡혀있으면 html/css보다 체계적이고 깔끔한 UI를 만들 수 있지만 상위 Widget에 대한 개념 지식이 많지 않아 어려움을 느꼈다. 특히 어디에서 문제가 발생했는지 찾을 수가 없는 부분에서 답답함을 많이 느꼈습니다. 또한 처음 사용해보는 언어이다보니 Provider 사용하는 방법이 익숙하지 않았던 점도 한계였습니다.


### 개선점
- 코드 리뷰를 통해 상위 위젯이 하위 위젯을 wrap할 수 있는지 확인하였으며, 체계적이고 깔끔한 UI를 만들 수 있었습니다. 데이터 연동으로 인한 widget 호환성 문제들에 대해서도 문서 및 자문을 통해 해결 할 수 있었습니다.


### 문제해결방법
- dart는 google에서 만든 디자인 프로그래밍 언어이다보니 위젯에 대한 소개가 document나 youtube로 잘 나와있는 편이었습니다. 다소 기능을 구현하는데 시간이 오래 걸리긴 했지만 자료들을 찾아보면서 하기에는 충분했던 것 같습니다. 또한 Provider와 관련된 예제들을 찾아보면서 사용 방법을 익혔고, User와 Booking 부분에 잘 적용하여 사용 할 수 있었습니다.


## 참조
- Iampay API : https://api.iamport.kr/
- QR API : https://github.com/zxing/zxing
