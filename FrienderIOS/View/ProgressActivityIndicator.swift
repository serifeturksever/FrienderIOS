//
//  ProgressActivityIndicator.swift
//  FrienderIOS
//
//  Created by Şerife Türksever on 27.07.2023.
//

import UIKit

fileprivate var progressView: UIView?

extension UIViewController {
    func showSpinner(){
        progressView = UIView(frame: self.view.bounds)
        progressView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.1)
        let progressIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        progressIndicator.center = progressView!.center
        progressIndicator.startAnimating()
        progressView?.addSubview(progressIndicator)
        self.view.addSubview(progressView!)
    }
    
    func removeSpinner(){
        progressView?.removeFromSuperview()
        progressView = nil
    }
}
