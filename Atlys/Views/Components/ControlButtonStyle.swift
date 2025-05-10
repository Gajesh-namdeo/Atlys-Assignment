//
//  Congh.swift
//  Atlys
//
//  Created by Gajesh on 09/05/25.
//

import SwiftUI

struct ControlButtonStyle: ButtonStyle {
    let enabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .background(enabled ? Color.blue : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(8)
            .opacity(enabled ? 1 : 0.5)
    }
}
