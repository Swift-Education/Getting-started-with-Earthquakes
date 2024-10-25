//
//  HTTPDataDownloader.swift
//  Earthquakes
//
//  Created by 강동영 on 10/22/24.
//

import Foundation

let validStatus = 200...299

protocol HTTPDataDownloader {
    func httpData(from: URL) async throws -> Data
}
// 2. HTTPDataDownloader를 구현하기 위해 URLSession에 확장을 추가하십시오.
extension URLSession: HTTPDataDownloader {
    // 3. URLSession의 data(from:delegate:) 메서드를 사용하여 HTTP 요청을 하십시오.
    func httpData(from url: URL) async throws -> Data {
        guard let (data, response) = try await self.data(from: url, delegate: nil) as? (Data, HTTPURLResponse),
              validStatus.contains(response.statusCode) else {
            throw QuakeError.networkError
        }
        return data
    }
}
