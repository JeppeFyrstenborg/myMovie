//
//  SortButton.swift
//  myMovie
//
//  Created by Line Nørgaard on 12/02/2023.
//

import SwiftUI

struct SortButton: View {
    @EnvironmentObject var movieController: MovieController
    
    var sortTypes: [SortType] = [.title, .year, .rating]
    
    var body: some View {
        
        HStack {
            Picker("", selection: $movieController.sortType) {
    //            Image(systemName: "arrow.up.arrow.down")
                ForEach(SortType.allCases, id: \.self) { sortType in
                    Text("Sort by \(sortType.toString)").tag(sortType)
                }
            }
            .pickerStyle(.menu)
        }
        .frame(height: 10)
    }
}

struct SortButton_Previews: PreviewProvider {

    static var previews: some View {
        SortButton().environmentObject(MovieController())
    }
}
