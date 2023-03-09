//
//  myMovieApp.swift
//  myMovie

import SwiftUI
import FirebaseCore

@main
struct myMovieApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    
    @StateObject private var movieController = MovieController()
    @StateObject private var navigationController = NavigationController()
    
    var body: some Scene {
        WindowGroup {
            MovieListView().environmentObject(movieController).environmentObject(navigationController)
        }
    }
}
