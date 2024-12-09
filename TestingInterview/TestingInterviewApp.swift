//
//  TestingInterviewApp.swift
//  TestingInterview
//
//  Created by Marsha Likorawung on 09/12/24.
//

import SwiftUI

@main
struct LibraryApp: App {
    @StateObject private var jobViewModel = JobViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.colorScheme, .light).environmentObject(jobViewModel)
        }
    }
}
