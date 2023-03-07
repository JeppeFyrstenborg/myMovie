//
//  PasswordView.swift
//  myMovie
//
//  Created by Line Nørgaard on 07/03/2023.
//

import SwiftUI

struct PasswordView: View {
    @State var showPassword: Bool = false
    @Binding var password: String
    
    var body: some View {
        HStack (alignment: .center, spacing: 15) {
            Group {
                if showPassword { // when this changes, you show either TextField or SecureField
                    ZStack(alignment: .trailing) {
                        TextFieldStandardView(text: $password, placeholder: "Password")
                        Button(action: {
                            self.showPassword.toggle()
                        }) {
                            Image(systemName: showPassword ? "eye.slash" : "eye")
                        }
                        .padding(.trailing, 10)
                    }
                    }
                 else {
                     ZStack(alignment: .trailing) {
                        SecureField("Password", // how to create a secure text field
                                    text: $password,
                                    prompt: Text("Password"))
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(.white)
                        .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.black.opacity(0.06), radius: 5, x: -5, y: -5)
                        
                        Button(action: {
                            self.showPassword.toggle()
                        }) {
                            Image(systemName: showPassword ? "eye.slash" : "eye")
                        }
                        .padding(.trailing, 10)
                    }
                    }
                }            }
    }
}

struct PasswordView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordView(password: Binding.constant(""))
    }
}
