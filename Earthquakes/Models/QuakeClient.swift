//
//  QuakeClient.swift
//  Earthquakes
//
//  Created by 강동영 on 10/22/24.
//

import Foundation

class QuakeClient {
    // 8. 지진을 가져오기 위해 계산된, 비동기, 던지기 속성을 추가하십시오.
    // 속성을 비동기적으로 만들거나 던지려면 계산된 속성에 대한 명시적 get 구문이 필요합니다.
    var quakes: [Quake] {
        get async throws {
            fatalError("Unimplemented")
        }
    }
    // 5. 익명 클로저를 사용하여 속성을 초기화하면 날짜 디코딩 전략을 변경할 수 있습니다.
    private lazy var decoder: JSONDecoder = {
        let aDecoder = JSONDecoder()
        aDecoder.dateDecodingStrategy = .millisecondsSince1970
        return aDecoder
    }()
    // 4. 정확하다는 것을 알고 있는 리터럴이기 때문에, 당신은 URL 이니셜라이저를 강제언래핑합니다.
    private let feedURL = URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson")!
    // 6. 다운로더 속성을 추가하고, 속성 값을 설정하기 위해 이니셜라이저를 추가하세요.
    // 실존적 가치(existential value) 사용 -> any HTTPDataDownloader
    private let downloader: any HTTPDataDownloader
    
    init(downloader: any HTTPDataDownloader = URLSession.shared) {
        self.downloader = downloader
    }
}
