//
//  NxtBtnView.swift
//  myMovie
//
//  Created by Line Nørgaard on 07/03/2023.
//

import SwiftUI

struct NxtBtnView: View {
    @EnvironmentObject var navigationController: NavigationController
    var clickable: Bool
    
    var movie: Movie
    
    var body: some View {
        Button {
            navigationController.MoveToThis(nxtMovie: movie)
        } label: {
            Image(systemName: "arrowshape.right.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
        }
        .disabled(!clickable)
        
    }
}

struct NxtBtnView_Previews: PreviewProvider {
    static var previews: some View {
        NxtBtnView(clickable: false, movie: Movie(title: "The Matrix", year: "1999", rating: 8.7, resume: "The Matrix is a science fiction action movie about a hacker named Neo who discovers that the reality he lives in is actually a simulated world created by sentient machines. He joins a group of rebels who fight against the machines and try to save humanity from being trapped in the Matrix.", urlString: "https://www.imdb.com/title/tt0133093/mediaviewer/rm525547776/?ref_=tt_ov_i")).environmentObject(NavigationController())
    }
}
