//
//  Query+Extensions.swift
//  GithubGraphQLApp
//
//  Created by Usha Sai Chintha on 10/06/23.
//

import Foundation
import Apollo

extension GetRepositoriesByUserNameQuery.Data.User.Repository.Node: RepositoryNode {
    var description: String? {
        ""
    }
}
extension GetTopRepositoriesForUserQuery.Data.User.Repository.Node: RepositoryNode { }
