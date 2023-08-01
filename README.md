# ios-box-office


[1. Team Introduce](#-team-sunblock-)

[2. Ground Rules](#-ground-rules)

[3. Goal](#-goal)

[4. STEP별 구현내용](#-step별-구현-내용)

[5. 트러블 슈팅](#-트러블-슈팅)

<br>

## 🧴 Team SUNBLock 🧴
🏃🏻🏃🏻‍♂️💨 **프로젝트 기간:** `23.04.24` ~ `23.05.16`

|<img src="https://avatars.githubusercontent.com/u/71758542?v=4" width=200>|<img src="https://avatars.githubusercontent.com/u/85678496?v=4" width=200>|
|:---:|:---:|
|[Blu](https://github.com/bomyuniverse)|[Sunny](https://github.com/SunnnySong)|

<br>

## ⛳ Ground Rules

- **커밋 규칙**
    - ✨ **Git Commit Convention**
        - Prefix 전체 소문자, **`prefix:`**
        - `feat` = 주로 사용자에게 새로운 기능이 추가되는 경우
        - `fix` = 사용자가 사용하는 부분에서 bug가 수정되는 경우
        - `docs` = 문서에 변경 사항이 있는 경우
        - `config` = 프로젝트 초기 설정 시
        - `style` = 세미콜론을 까먹어서 추가하는 것 같이 형식적인 부분을 다루는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
        - `refactor` = production code를 수정하는 경우 (변수의 네이밍을 수정하는 경우)
        - `test` = 테스트 코드를 수정하거나, 추가하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
        - `chore` = 별로 중요하지 않은 일을 수정하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
        - +) `design` = UI 디자인을 변경했을 때
- **코드 컨벤션**
    - 반환값이 명확한 경우(예: 클로저 내부에 반환값밖에 없는 경우) return 키워드 생략
    - class, struct, enum, protocol, func 뒤에 한 줄 개행 후 코드 작성
    - 개행 기준 → 클로저가 두 개 연속으로 있는 경우 개행 X, 클로저 뒤에 바로 다른 코드가 오는 경우 개행하기
- 브랜치 → step 별로 구분, PR 시 main으로 전송
- **천천히 차근차근, 하나씩 하기**

<br>

## ⚽️ Goal

- 설계를 먼저 시도하고 구현하기
- 폴더링 규칙
    - Controller가 무겁지 않은 MVC 패턴 적용해보기
- 리드미 정리하기 → Project에 적기
    - 트러블슈팅 기록 잘 하기
- 모르는 코드 쓰지 않기
    - 필요한 기능인데 모른다면 충분히 학습하기
- 모르는 부분이 오래 지속된다면 리뷰어에게 질문하기, 질문 많이 하기
- 리뷰어와 **적극!** 소통하기!

<br>

## 🔨 STEP별 구현 내용

### STEP 1
- **모델 타입 구현**
    - UML을 작성하여 모델을 설계한 후 모델 타입 구현
    - 주어진 JSON 데이터를 Model 타입으로 Parsing할 수 있는지 Unit Test 진행
- 🗝️ keyword: `Data Transfer Object`, `CodingKey`, `Unit Test`
- [STEP 1 PR 🔗](https://github.com/tasty-code/ios-box-office/pull/6)

### STEP 2
- **네트워킹 타입 구현**
    - 영화진흥위원회의 API를 호출할 때 사용되는 Key 은닉화
    - API를 통해 수신한 영화 상세정보에 대한 DTO 타입 구현
    - 네트워크 통신을 담당할 타입 설계 및 구현
    - Unit Test를 통한 네트워크 타입 테스트
- 🗝️ keyword: `REST API`, `HTTP Request`, `URL Components`, `API Key 은닉화`, `네트워크 구조`
- [STEP 2 PR 🔗](https://github.com/tasty-code/ios-box-office/pull/11)

### STEP 3
- **박스오피스 목록 화면 구현**
    - Mock 데이터를 활용한 Collection View 구현
    - Collection View에 보여질 모델 타입 구현
    - Safe Area을 고려한 오토 레이아웃 구현
- 🗝️ keyword: `Controller가 가벼운 MVC`, `데이터 전달 방식`, `휴먼 에러`
- [STEP 3 PR 🔗](https://github.com/tasty-code/ios-box-office/pull/16)

### STEP 4
- **네트워크 통신 및 영화 상세화면 구현**
    - 이미지 검색 API와의 통신
    - 네트워크 통신을 담당하는 타입 개선
    - StackView를 활용한 영화 상세정보를 나타내는 뷰 구현
    - refresh control 개선
- 🗝️ keyword: `Protocol`, `Generic`, `UI Layout`, `UICalendarView`
- [STEP 4 PR 🔗](https://github.com/tasty-code/ios-box-office/pull/19)

<br>

## 🚀 트러블 슈팅
## App Transport Security (ATS) Error

### 문제 발생
![](https://i.imgur.com/pjrB6KQ.png)
- 해당 코드는 MovieAPI 통신을 통해 데이터가 들어오는지 테스트하는 Unit Test이다.
- `request` 메서드 실행 중에 error가 발생했다.
    - 네트워크 통신의 결과가 오기 전, 과정에서 오류가 발생했다.

### 원인 분석
![](https://i.imgur.com/5LKBHD5.png)
- 원인은 App Transport Security (ATS) 위반이다.
    - ATS 정책으로 인해 보안 연결을 요구하는데, 앱이 안전하지 않은 방법으로 인터넷에 연결하려고 시도할 때 발생한다.
    - ATS는 iOS 9 이상에서 기본적으로 사용되며, 앱이 네트워크 통신을 하는 경우 ATS가 요구하는 보안 규칙을 준수해야 한다.

### 해결방법
- HTTP 대신 HTTPS를 사용한다.
- 요청하는 도메인이 ATS 예외 규칙을 충족하는지 확인한다.

**변경 전 코드**
```swift
// MovieAPI.swift
 static var scheme: String {
    return "http"
}
```
**변경 후 코드** 
```swift
// MovieAPI.swift
 static var scheme: String {
    return "https"
}
```

<br>

## Separator layout guide

### 문제 발생
<img src="https://hackmd.io/_uploads/BkrQApdVh.png" width="400" height="400">

- (View 화면을 구현하고 있던 중이라,, 컬러플한 cell 이해 바랍니다,,,😅)
- Separator layout guide가 왼쪽 끝까지 붙지 않는 문제 발생

### 문제 해결 시도
- Apple 공식문서에 있는 Modern Collection Views 프로젝트에서 separatorLayoutGuide 키워드 힌트를 얻었다.
    - CustomCellListViewController.swift 내부의 updateSeparatorConstraint() 함수
    - <img src="https://hackmd.io/_uploads/rkLn0puV3.png" width="400" height="400">
    - 해당 프로젝트에서는 separatorLayoutGuide를 UIListContentView.textLayoutGuide.leadingAnchor 과 동일하게 주었다.
    ```swift
    private func updateSeparatorConstraint() {
        guard let textLayoutGuide = listContentView.textLayoutGuide else { return }
        if let existingConstraint = separatorConstraint, existingConstraint.isActive {
            return
        }
        let constraint = separatorLayoutGuide.leadingAnchor.constraint(equalTo: textLayoutGuide.leadingAnchor)
        constraint.isActive = true
        separatorConstraint = constraint
    }
    ```

### 문제 해결
```swift
let constraint = separatorLayoutGuide.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
constraint.isActive = true
```

<br>

## 영화 포스터 이미지 비율대로 설정하기

### 문제 발생

<img src="https://hackmd.io/_uploads/ByY4hh-S2.png" width="260" height="450">

- 영화 세부정보를 보여주는 화면에서 영화 포스터 자체의 이미지 비율이 아니라 StackView의 layout에 꽉 차서 이미지가 나오는 문제 발생
- 이미지 고유의 비율이 아니기 때문에 이미지가 부자연스럽게 보이는 현상이 발생

### 문제 도전
아래 키워드에 대해 학습하면서 이미지 크기 조정을 시도함

- **contentMode** : View의 bounds가 변경될 때, content가 어떻게 배치될지 결정하는데 사용하는 mode

- contentMode를 쉽게 이해할 수 있는 그림 [출처](https://blog.naver.com/PostView.naver?blogId=soojin_2604&logNo=222439470655&parentCategoryNo=&categoryNo=&viewDate=&isShowPopularPosts=false&from=postView)
- <img src="https://hackmd.io/_uploads/SkCGah-S2.png" width="400" height="500"> 
    
- contentMode.scaleAspectFit : content 고유의 비율은 유지하면서, View 크기에 맞게 확장, 나머지 영역은 투명하게 변경됨

### 문제 해결
<img src="https://hackmd.io/_uploads/HkWw03bH2.png" width="260" height="450">

- UIImageView에 `contentMode` 설정
    ```swift
    private let moviePoster: UIImageView = {

        let imageView = UIImageView()
        imageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    ```

<br>
