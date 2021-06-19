//
//  ContentView.swift
//  OnSubMit
//
//  Created by Eugene Berezin on 6/17/21.
//

import SwiftUI

struct ContentView: View {
    @State private var login = ""
    @State private var password = ""
    @State private var isAuthenticated = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    TextField("Login", text: $login)
                        .textFieldStyle(.roundedBorder)
                    TextField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
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
