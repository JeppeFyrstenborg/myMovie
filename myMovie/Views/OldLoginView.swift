//
//  OldLoginView.swift
//  myMovie
//
//  Created by Line Nørgaard on 07/03/2023.
//

import SwiftUI

struct OldLoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State var showPassword: Bool = false
    @State var isFocusedName: Bool = false
    @State private var isFocusedPass: Bool = false
//    Image(systemName: "rectangle.portrait.and.arrow.right")
    
    var body: some View {
            VStack(alignment: .center, spacing: 15) {
                Spacer()
                Text("Login")
                    .font(.largeTitle)
        
//                TextField("Name", text: $username )
//                    .padding(10)
//                    .background(isFocusedName ? Color.white : Color.blue.opacity(0.2))
//                    .overlay {
//                        RoundedRectangle(cornerRadius: 3)
//                            .stroke(.blue, lineWidth: 2)
//                    }
//                    .padding(.horizontal, 50)
//                    .onTapGesture {
//                        self.isFocusedName = true
//                        self.isFocusedPass = false
//                    }
//                TextFieldStandardView(placeholder: "Username")
//                    .padding(.horizontal, 50)
                HStack (alignment: .center, spacing: 15) {
                    Group {
                        if showPassword { // when this changes, you show either TextField or SecureField
                            HStack {
                                TextField("Password",
                                            text: $password,
                                            prompt: Text("Password").foregroundColor(.red))
                                // How to change the color of the TextField Placeholder
                                .background(isFocusedPass ? Color.white.opacity(1.0) : Color.red.opacity(0.1))
                                .onTapGesture {
                                    self.isFocusedName = false
                                    self.isFocusedPass = true
                            }
                                Spacer()
                                Button(action: {
                                    self.showPassword.toggle()
                                }) {
                                    Image(systemName: showPassword ? "eye.slash" : "eye")
                                }
                            }
                        } else {
                            HStack {
                                SecureField("Password", // how to create a secure text field
                                            text: $password,
                                            prompt: Text("Password").foregroundColor(.red))
                                // How to change the color of the TextField Placeholder
                                .background(isFocusedPass ? Color.white.opacity(1.0) : Color.red.opacity(0.01))
                                .onTapGesture {
                                    self.isFocusedName = false
                                    self.isFocusedPass = true
                            }
                                Button(action: {
                                    self.showPassword.toggle()
                                }) {
                                    Image(systemName: showPassword ? "eye.slash" : "eye")
                                }
                            }
                        }
                    }
                    .padding(10)
                    .background(isFocusedPass ? Color.white.opacity(1.0) : Color.red.opacity(0.1))
                    .overlay {
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(.red, lineWidth: 2)
                        // How to add rounded corner to a TextField and change it color
                    }

                }
//                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.horizontal, 50)
                    Spacer()
            }// Vstack end
        }// Body end
    }// View end

struct OldLoginView_Previews: PreviewProvider {
    static var previews: some View {
        OldLoginView()
    }
}
