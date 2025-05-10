//
//  ItemControlBar.swift
//  Atlys
//
//  Created by Gajesh on 09/05/25.
//

import SwiftUI

struct ItemControlBar: View {
    let itemType: ItemType
    @Binding var items: [String]
    @Binding var oppositeItems: [String]

    var totalCount: Int { items.count + oppositeItems.count }
    var canAdd: Bool { totalCount < ItemLimits.maxItems }
    var canRemove: Bool { !items.isEmpty }

    var body: some View {
        HStack {
            Spacer()

            Button("Add \(itemType.rawValue)") {
                withAnimation {
                    if canAdd {
                        items.append("New Item \(items.count + 1)")
                    }
                }
            }
            .buttonStyle(
                ControlButtonStyle(enabled: canAdd)
            )
            .disabled(!canAdd)

            Spacer()

            Button("Remove \(itemType.rawValue)") {
                withAnimation {
                    if canRemove {
                        items.removeLast()
                    }
                }
            }
            .buttonStyle(
                ControlButtonStyle(enabled: canRemove)
            )
            .disabled(!canRemove)

            Spacer()
        }
    }
}
