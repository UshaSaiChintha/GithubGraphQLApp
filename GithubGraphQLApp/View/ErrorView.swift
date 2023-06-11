//
//  ErrorView.swift
//  GithubGraphQLApp
//
//  Created by Usha Sai Chintha on 10/06/23.
//

import SwiftUI

struct ErrorView: View {
    
    let errors: [ErrorViewModel]
    
    var body: some View {
        VStack {
            ForEach(errors, id: \.id) { error in
                Text(error.message ?? "")
                    .foregroundColor(.red)
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errors: [ErrorViewModel(message: "Repository has already been created!")])
    }
}
