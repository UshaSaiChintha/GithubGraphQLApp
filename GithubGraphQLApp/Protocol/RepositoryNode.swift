//
//  RepositoryNode.swift
//  GithubGraphQLApp
//
//  Created by Usha Sai Chintha on 12/06/23.
//

import Foundation
import Apollo

protocol RepositoryNode {
    var id: GraphQLID { get }
    var name: String { get }
    var description: String? { get }
    var stargazerCount: Int { get }
}
