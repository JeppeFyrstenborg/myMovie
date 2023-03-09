//
//  NavigationButtonsView.swift
//  myMovie
//
//  Created by Line Nørgaard on 12/02/2023.
//

import SwiftUI

struct NavigationButtonsView: View {
    @EnvironmentObject var movieController: MovieController
    var movie: Movie

    
    var body: some View {
        let currIndex = movieController.IndexOfThis(movie: movie)
        Spacer()
            .frame(height: 20)
        VStack{
            HStack{
                let prevMovie = movieController.CheckForPrevMovieWith(currIndex: currIndex)
                if prevMovie != nil{
                    PrevBtnView(clickable: true, movie: prevMovie!)
                }
                Spacer()
                let nxtMovie = movieController.CheckForNxtMovieWith(currIndex: currIndex)
                if nxtMovie != nil{
                    NxtBtnView(clickable: true, movie: nxtMovie!)
                }
            }
            .padding(.horizontal, 80)
            }
        .frame(height: 80)

    }
}

//struct NavigationButtonsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationButtonsView(movie: Movie(title: "The Matrix", year: "1999", rating: 8.7, resume: "The Matrix is a science fiction action movie about a hacker named Neo who discovers that the reality he lives in is actually a simulated world created by sentient machines. He joins a group of rebels who fight against the machines and try to save humanity from being trapped in the Matrix.")).environmentObject(MovieController())
//    }
//}
