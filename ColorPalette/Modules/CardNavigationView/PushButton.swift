//
//  PushButton.swift
//  ColorPalette
//
//  Created by Michael Borisov on 23.03.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import SwiftUI

struct PushButton<Label, Destination>: View where Label: View, Destination: View {
    
    @EnvironmentObject private var viewModel: CardNavigationViewModel
    
    private let destination: Destination
    private let label: Label

    init(destination: Destination, @ViewBuilder label: @escaping () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        label.onTapGesture {
            self.push()
        }
        .foregroundColor(.blue)
    }
    
    private func push() {
        self.viewModel.push(self.destination)
    }
}
