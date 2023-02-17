//
//  ActivityView.swift
//  HelloWorld
//
//  Created by Robert Hoang on 17/02/2023.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    var activityItems: [Any]
        var applicationActivities: [UIActivity]? = nil
        func makeUIViewController(context: Context) -> some UIViewController {
            let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
            return activityController
    }
        func updateUIViewController(_ uiViewController: UIViewControllerType,
    context: Context) {
    }
}

//struct ActivityView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivityView(activityItems: <#[Any]#>)
//    }
//}
