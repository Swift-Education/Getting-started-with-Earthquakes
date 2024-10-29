//
//  QuakesProvider.swift
//  Earthquakes
//
//  Created by 강동영 on 10/24/24.
//

import Foundation

@MainActor
class QuakesProvider: ObservableObject {
    @Published var quakes: [Quake] = []
    
    // 2. 기본 QuakeClient 인스턴스로 클라이언트 속성과 이니셜라이저를 추가
    let client: QuakeClient
    
    // 3. client에서 quakes을 로드하고 게시된 지진 배열을 업데이트하는 fetchQuakes 함수를 추가
    func fetchQuakes() async throws {
        let latestQuakes = try await client.quakes
        self.quakes = latestQuakes
    }
    
    // 4. 배열에서 요소를 삭제하는 deleteQuakes 함수를 추가
    func deleteQuakes(atOffsets offsets: IndexSet) {
        quakes.remove(atOffsets: offsets)
    }
    
    func location(for quake: Quake) async throws -> QuakeLocation {
        return try await client.quakeLocation(from: quake.detail)
    }
    
    init(client: QuakeClient = QuakeClient()) {
        self.client = client
    }
}
