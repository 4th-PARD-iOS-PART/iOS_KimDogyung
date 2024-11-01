# 과제6

<p align="center">
<img src="./images/img1.png" width="30%" height="30%"/>
<img src="./images/img2.png" width="30%" height="30%"/>
<img src="./images/img3.png" width="30%" height="30%"/>
<img src="./images/img4.png" width="30%" height="30%"/>
</p>

# 1. APISevice

1. 데이터 모델링

   - API 응답에 맞는 데이터 모델 정의
   - 요청 파라미터 모델 정의

2. API 버전 관리

   - API 엔드포인트 변경 관리
   - API 버전 업데이트 처리

```swift

import Foundation

struct APIService {
    // Base URL for API
    private let baseURL = "http://ec2-13-209-3-68.ap-northeast-2.compute.amazonaws.com:8080"

    // Enum for specifying API endpoints
    enum Endpoint: String {
        case user = "/user"
    }

    // Method to construct full URL with query parameters

    // queryParams
    // 정렬이나 필터링이 필요할때 사용
    //URL 뒤에 물음표(?)와 함께 붙는 키-값(Key-Value) 쌍입니다. 여러 개의 쿼리 파라미터를 전달하려면 파라미터 사이에 앰퍼샌드(&)를 추가해서 하나의 문자열(string)로 전달하세요. 쿼리 파라미터로는 문자열뿐만 아니라 숫자, 리스트 등 다양한 형태의 데이터를 넣을 수 있어요.
    // /users?id=123&  # 아이디가 123인 사용자를 가져온다.
    // queryParams: [String: String] = [:] 딕셔너리 타입 파라미터를 받는데 기본값으로 빈 딕셔너리 지정
    func makeURL(endpoint: Endpoint, queryParams: [String: String] = [:]) -> URL? {
        var urlString = baseURL + endpoint.rawValue

        // Adding query parameters
        if !queryParams.isEmpty {
            // $0 는 딕셔너리 내의 현재 가리키고 있는 아이템
            // 다음 키-밸류를 위해 &로 구분
            let queryString = queryParams.map { "\($0.key)=\($0.value)" }.joined(separator: "&")
            urlString += "?\(queryString)"
        }

        return URL(string: urlString)
    }
}

```

# 2. NetworkManager

1. 네트워크 통신의 기본적인 처리

   - URL 생성 및 관리
   - HTTP 요청 설정 (GET, POST, PATCH, DELETE 등)
   - 헤더 설정
   - 데이터 직렬화/역직렬화

2. 에러 처리

   - 네트워크 연결 오류
   - 잘못된 URL
   - 데이터 없음
   - 디코딩 오류

3. 공통설정관리 (템플릿 관리)

   - baseURL 관리
   - 공통 헤더
   - 타임아웃 설정
   - 캐싱 정책
