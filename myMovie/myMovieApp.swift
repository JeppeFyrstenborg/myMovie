//
//  myMovieApp.swift
//  myMovie

import SwiftUI

@main
struct myMovieApp: App {
    @StateObject private var movieViewModel = MovieViewModel()
    
    var body: some Scene {
        WindowGroup {
            MovieListView().environmentObject(movieViewModel)
        }
    }
}
