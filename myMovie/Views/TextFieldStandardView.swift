//
//  TextFieldStandardView.swift
//  myMovie
//
//  Created by Line Nørgaard on 07/03/2023.
//

import SwiftUI

struct TextFieldStandardView: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        HStack(spacing: 10){
            TextField(placeholder, text: $text)
                .autocorrectionDisabled()
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(.white)
        .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
        .shadow(color: Color.black.opacity(0.06), radius: 5, x: -5, y: -5)
    }
}

struct TextFieldStandardView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldStandardView(text: Binding.constant("Hello World"), placeholder: "Username")
    }
}
