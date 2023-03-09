//
//  test.swift
//  myMovie
//
//  Created by Line Nørgaard on 11/02/2023.
//

import SwiftUI

struct test: View {

        var body: some View {
            VStack {
                AsyncImage(url: URL(string:"https://wehco.media.clients.ellingtoncms.com/img/photos/2021/06/10/homemovies_0611_rgb_t800.jpg?90232451fbcadccc64a17de7521d859a8f88077d")) { image in
                    image
                        .resizable()
                } placeholder: {
                    ProgressView()
                }
                
            }
        }
    
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
