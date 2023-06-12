//
//  ContentView.swift
//  GithubGraphQLApp
//
//  Created by Usha Sai Chintha on 10/06/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var repositoriesDisplay: String = "latest"
    @State private var isPresented: Bool = false
    @StateObject private var repositoryListViewModel = RepositoryListViewModel()
    @State private var cancellable: AnyCancellable?
    
    var body: some View {
        VStack {
            
            Picker("Select", selection: $repositoryListViewModel.repositoriesDisplay, content: {
                Text("Latest").tag(RepositoriesDisplay.latest)
                Text("Top").tag(RepositoriesDisplay.top)
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
            
            // sink gets triggered whenver the selection is changed between latest and top. sink gets actual value of display
            
            self.cancellable = repositoryListViewModel.$repositoriesDisplay.sink { (display) in
                switch display {
                    case .latest:
                    repositoryListViewModel.getLatestRepositoriesForUser(username: Constants.User.username)
                    case .top:
                    repositoryListViewModel.getTopRepositoriesForUser(username: Constants.User.username)
                }
            }
        })
        .navigationBarItems(trailing: Button(action: {
            isPresented = true
        }, label: {
            Image(systemName: "plus")
        }))
        .sheet(isPresented: $isPresented, onDismiss: {
            repositoryListViewModel.getLatestRepositoriesForUser(username: Constants.User.username)
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
