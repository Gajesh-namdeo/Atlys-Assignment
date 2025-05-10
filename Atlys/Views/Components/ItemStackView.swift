//
//  hgng.swift
//  Atlys
//
//  Created by Gajesh on 09/05/25.
//

import SwiftUICore

struct ItemStackView: View {
    let items: [String]

    var body: some View {
        ForEach(items, id: \.self) { item in
            Text(item)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
        }
    }
}
