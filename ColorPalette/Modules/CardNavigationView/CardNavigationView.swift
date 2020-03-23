//
//  CardNavigationView.swift
//  ColorPalette
//
//  Created by Michael Borisov on 23.03.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import SwiftUI

struct NavControllerView<Content>: View where Content: View{
    
    @ObservedObject private var viewModel: CardNavigationViewModel
    
    private let content: Content
    private let transitions: (push: AnyTransition, pop: AnyTransition)
    
    init(transition: NavTransition,
         easing: Animation = .linear,
         @ViewBuilder content: @escaping () -> Content)
    {
        self.viewModel = CardNavigationViewModel(easing: easing)
        self.content = content()
        switch transition {
        case .custom(let trans):
            self.transitions = (trans, trans)
        case .none:
            self.transitions = (.identity, .identity)
        /*default:
            self.transitions = (.identity, .identity)*/
        }
    }
    
    var body: some View {
        let isRoot = viewModel.currentScreen == nil
        return ZStack {
            if isRoot {
                content
                    .transition(viewModel.navigationType == .push ? transitions.push : transitions.pop )
                    .environmentObject(viewModel)
            } else {
                viewModel.currentScreen!.nextScreen
                    .transition(viewModel.navigationType == .push ? transitions.push : transitions.pop )
                    .environmentObject(viewModel)
            }
        }
    }
    
}
