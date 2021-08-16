//
//  AdaptiveCardView.swift
//  MSAdaptiveCardExample
//
//  Created by Eidinger, Marco on 8/16/21.
//

import Foundation
import SwiftUI

struct AdaptiveCardView: UIViewControllerRepresentable {

    var cardJson: String

    func makeUIViewController(context: Context) -> AdaptiveCardViewController {
        let vc = AdaptiveCardViewController()
        vc.cardJson = cardJson
        return vc
    }

    func updateUIViewController(_ uiViewController: AdaptiveCardViewController, context: Context) {
        ()
    }

    typealias UIViewControllerType = AdaptiveCardViewController
}
