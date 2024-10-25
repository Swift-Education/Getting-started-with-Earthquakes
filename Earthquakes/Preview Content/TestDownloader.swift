//
//  TestDownloader.swift
//  Earthquakes
//
//  Created by 강동영 on 10/24/24.
//

import Foundation

class TestDownloader: HTTPDataDownloader {
    func httpData(from: URL) async throws -> Data {
        // 함수가 구현되지 않는 동안 컴파일러 오류를 방지
        try await Task.sleep(nanoseconds: UInt64.random(in: 100_000_000...500_000_000))
        return testQuakesData
    }
}
