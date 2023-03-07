//
//  NavigationController.swift
//  myMovie
//
//  Created by Line Nørgaard on 07/03/2023.
//

import Foundation

class NavigationController: ObservableObject{
    @Published var moviePath: [Movie]
    
    init(moviePath: [Movie] = []
    ) {
        self.moviePath = moviePath
    }
    
    
    func MoveToThis(nxtMovie: Movie){
        moviePath.removeLast()
        moviePath.append(nxtMovie)
    }
    
    
    
    
}
