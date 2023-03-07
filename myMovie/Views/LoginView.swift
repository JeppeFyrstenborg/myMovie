//
//  LoginView.swift
//  myMovie
//
//  Created by Line Nørgaard on 10/02/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
            VStack(alignment: .center, spacing: 15) {
                Spacer()
                Text("Login")
                    .font(.largeTitle)
                TextFieldStandardView(text: $username, placeholder: "Username")
                    .padding(.horizontal, 50)
                PasswordView(password: $password)
                    .padding(.horizontal, 50)
                Spacer()
            }// Vstack end
        }// Body end
    }// View end

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
