//
//  SVGLayoutViewController.swift
//  SVGInteraction
//
//  Created by Ankur Lahiry on 6/12/19.
//  Copyright © 2019 Prefeex. All rights reserved.
//

import UIKit

protocol SVGLayoutViewControllerDelegate {
    func getId(id : String?)
}

class SVGLayoutViewController: UIViewController {
    var svgScrollView: SVGScrollView!
    
    var delegate : SVGLayoutViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.svgScrollView = SVGScrollView(template: "world", frame: self.view.frame)
        svgScrollView.scrollViewDelegate = self
        self.view.addSubview(self.svgScrollView)
        self.svgScrollView.backgroundColor = .white
        self.svgScrollView.scrollViewDelegate = self
    }

}

extension SVGLayoutViewController : SVGScrollViewDelegate {
    func getId(id : String?) {
        self.delegate?.getId(id: id)
    }
}
