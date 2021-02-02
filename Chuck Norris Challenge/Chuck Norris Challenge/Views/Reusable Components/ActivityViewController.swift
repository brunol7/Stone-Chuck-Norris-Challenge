//
//  ActivityViewController.swift
//  Chuck Norris Challenge
//
//  Created by Bruno Luebke on 01/02/21.
//

import Foundation
import UIKit
import SwiftUI

/// Creating a UIViewControllerRepresentable so we can use the ActivityViewController from UIKit in SwiftUI scope, once there's still no native share instance
struct ActivityViewController: UIViewControllerRepresentable {

    /// The array with data objects passed to the ActiviTyViewController
    var activityItems: [Any]
    
    /// The UIActivities our app supports, defined to nill becaus our app do not have any service for outside activities
    var applicationActivities: [UIActivity]? = nil

    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}

}
