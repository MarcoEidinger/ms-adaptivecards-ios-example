//
//  AdaptiveCardView.swift
//  MSAdaptiveCardExample
//
//  Created by Eidinger, Marco on 8/16/21.
//

import Foundation
import SwiftUI

struct AdaptiveCardView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> AdaptiveCardViewController {
        return AdaptiveCardViewController()
    }

    func updateUIViewController(_ uiViewController: AdaptiveCardViewController, context: Context) {
        ()
    }

    typealias UIViewControllerType = AdaptiveCardViewController
}
