//
//  NxtBtnView.swift
//  myMovie
//
//  Created by Line Nørgaard on 07/03/2023.
//

import SwiftUI

struct NxtBtnView: View {
    @EnvironmentObject var movieViewModel: MovieViewModel
    var clickable: Bool
    
    var movie: Movie
    
    var body: some View {
        Button {
            movieViewModel.MoveToThisPath(nxtMovie: movie)
        } label: {
            Image(systemName: "arrowshape.right.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
        }
        .disabled(!clickable)
    }
}

//struct NxtBtnView_Previews: PreviewProvider {
//    static var previews: some View {
//        NxtBtnView()
//    }
//}
