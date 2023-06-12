//
//  RespositoryListViewModel.swift
//  GithubGraphQLApp
//
//  Created by Usha Sai Chintha on 10/06/23.
//

import Foundation
import Apollo

typealias Node = GetRepositoriesByUserNameQuery.Data.User.Repository.Node

class RepositoryListViewModel: ObservableObject {
    
    @Published var respositories: [RepositoryViewModel] = []
    
    func getLatestRepositoriesForUser(username: String) {
        
        Network.shared.apollo.fetch(query: GetRepositoriesByUserNameQuery(username: username), cachePolicy: .fetchIgnoringCacheData) { result in
            switch result {
                case .success(let graphQLResult):
                   
                    guard let data = graphQLResult.data,
                          let user = data.user,
                          let nodes = user.repositories.nodes
                          else {
                        return
                    }
                
                // compactMap helps with ignoring null values
                    
                    DispatchQueue.main.async {
                        self.respositories = nodes.compactMap { $0 }.map(RepositoryViewModel.init)
                    }
                    
                case .failure(let error):
                    print(error)
            }
            
        }
        
    }
    
}

struct RepositoryViewModel {
    
    let node: Node
    
    var hasRating: Bool {
        node.stargazerCount > 0
    }
    
    var id: GraphQLID {
        node.id
    }
    
    var name: String {
        node.name
    }
    
    var starCount: Int {
        node.stargazerCount
    }
    
}
