//
//  LJPBucketListApp.swift
//  LJPBucketList
//
//  Created by Tine Ramos on 19/11/2024.
//

import SwiftUI
import SwiftData

@main
struct LJPBucketListApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
			DashboardView()
        }
        .modelContainer(sharedModelContainer)
    }
}
