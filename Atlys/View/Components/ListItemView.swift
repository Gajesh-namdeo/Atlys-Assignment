//
//  ListItemView.swift
//  Atlys
//
//  Created by Gajesh on 09/05/25.
//

import SwiftUI

struct ListItemView: View {
    let text: String

    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
    }
}
