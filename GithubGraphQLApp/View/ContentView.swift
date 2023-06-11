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
    @StateObject private var repositoryListViewModel = RepositoryListViewModel()
    
    var body: some View {
        VStack {
            
            Picker("Select", selection: $repositoriesDisplay, content: {
                Text("Latest").tag("latest")
                Text("Top").tag("top")
            }).pickerStyle(SegmentedPickerStyle())
            
            
            List(repositoryListViewModel.respositories, id: \.id) { repository in
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(repository.name)
                            .font(.headline)
                    }
                    Spacer()
                    
                    if repository.hasRating {
                        HStack {
                            Text("\(repository.starCount)")
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                }
            }.listStyle(PlainListStyle())
        }
        .padding()
        .onAppear(perform: {
            repositoryListViewModel.getLatestRepositoriesForUser(username: Constants.User.username)
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
