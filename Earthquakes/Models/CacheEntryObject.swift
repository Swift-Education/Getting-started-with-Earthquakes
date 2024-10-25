//
//  CacheEntryObject.swift
//  Earthquakes
//
//  Created by 강동영 on 10/25/24.
//

import Foundation

final class CacheEntryObject {
    let entry: CacheEntry
    init(entry: CacheEntry) { self.entry = entry }
}

// 2. 열거형 CacheEntry 추가
enum CacheEntry {
    // 요청되었지만 로드되지 않은 위치에 대한 두 번째 네트워크 요청을 피하기 위해 사용
    case inProgress(Task<QuakeLocation, Error>)
    case ready(QuakeLocation)
}
