//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Thach Huynh on 01/01/2024.
//

import SwiftUI

@MainActor
class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
 
    private static func fileUrl() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("scrum.data")
    }
    
    func load() async throws {
        //You store the task in a let constant so that later you can access values returned or catch errors thrown from the task.
        let task = Task<[DailyScrum], Error> {
            let fileUrl = try Self.fileUrl()
            guard let data = try? Data(contentsOf: fileUrl) else {
                return []
            }
            let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: data)
            return dailyScrums
        }
        let scrums = try await task.value
        self.scrums = scrums
    }
    func save(scrums: [DailyScrum]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(scrums)
            let outFile = try Self.fileUrl()
            try data.write(to: outFile)
        }
        _ = try await task.value
    }
}
