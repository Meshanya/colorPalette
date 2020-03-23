//
//  PopButton.swift
//  ColorPalette
//
//  Created by Michael Borisov on 23.03.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import SwiftUI

struct PopButton<Label>: View where Label: View {
    
    @EnvironmentObject private var viewModel: CardNavigationViewModel
    
    private let destination: PopDestination
    private let label: Label
    
    init(destination: PopDestination, @ViewBuilder label: @escaping () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        label.onTapGesture {
            self.pop()
        }
        .foregroundColor(.blue)
    }
    
    private func pop() {
        viewModel.pop(to: destination)
    }
    
}
