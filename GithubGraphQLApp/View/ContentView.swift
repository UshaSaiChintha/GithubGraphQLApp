//
//  ContentView.swift
//  GithubGraphQLApp
//
//  Created by Usha Sai Chintha on 10/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var repositoriesDisplay: String = "latest"
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            
            Picker("Select", selection: $repositoriesDisplay, content: {
                Text("Latest").tag("latest")
                Text("Top").tag("top")
            }).pickerStyle(SegmentedPickerStyle())
            
            
            List(1...20, id: \.self) { repository in
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Name \(repository)")
                            .font(.headline)
                        Text("Description \(repository)")
                    }
                    Spacer()
                    
                        HStack {
                            Text("\(repository)")
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    
                }
            }.listStyle(PlainListStyle())
        }
        .padding()
        .onAppear(perform: {
            
           
        })
        .navigationBarItems(trailing: Button(action: {
            isPresented = true
        }, label: {
            Image(systemName: "plus")
        }))
        .sheet(isPresented: $isPresented, onDismiss: {
            
        }, content: {
            AddRepositoryScreen()
        })
        .navigationTitle("Repositories")
        .embedInNavigationView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
