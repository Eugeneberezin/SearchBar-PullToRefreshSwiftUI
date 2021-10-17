//
//  ContentView.swift
//  OnSubMit
//
//  Created by Eugene Berezin on 6/17/21.
//

import SwiftUI
enum Field: Hashable {
    case login
    case password
}

struct ContentView: View {
    @FocusState private var focusedField: Field?
    @State private var login = ""
    @State private var password = ""
    @State private var isAuthenticated = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    TextField("Login", text: $login)
                        .textFieldStyle(.roundedBorder)
                        .focused($focusedField, equals: .login)
                    TextField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .focused($focusedField, equals: .password)
                    if isAuthenticated {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .background(Color.green)
                            Text("**AUTHENTICATED**")
                                .font(.title)
                        }
                    }
                
                }
                .animation(.spring(response: 1.5, dampingFraction: 1, blendDuration: 0.9), value: isAuthenticated)
                .frame(width: 300, height: 200, alignment: .center)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(8)
                .padding()
                .onSubmit {
                    if !login.isEmpty && !password.isEmpty {
                        isAuthenticated = true
                    } else {
                        isAuthenticated = false
                    }
                    if login.isEmpty {
                        focusedField = .login
                    } else if password.isEmpty {
                        focusedField = .password
                    }
                }
                Spacer()
            }
            .frame(minWidth: 700)
            .background(Color.blue)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
