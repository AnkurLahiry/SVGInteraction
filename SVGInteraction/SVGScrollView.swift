//
//  SVGScrollView.swift
//  SVGInteraction
//
//  Created by Ankur Lahiry on 6/12/19.
//  Copyright © 2019 Prefeex. All rights reserved.
//

import UIKit
import Foundation
import Macaw

protocol SVGScrollViewDelegate {
    func getId(id : String?)
}

class SVGScrollView: UIScrollView {
    
    let maxScale: CGFloat = 15.0
    let minScale: CGFloat = 1.0
    let maxWidth: CGFloat = 4000.0
    
    var svgView : SVGMacawView!
    var scrollViewDelegate : SVGScrollViewDelegate?
    
    private var scaleValue : CGFloat = 0
    private var zoomValue : CGFloat = 1.2
    
    public init(template: String, frame : CGRect) {
        super.init(frame: frame)
        svgView = SVGMacawView(template: template, frame: CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        addSubview(svgView)
        svgView.delegate = self
        contentSize = svgView.bounds.size
        minimumZoomScale = minScale
        maximumZoomScale = maxScale
        decelerationRate = UIScrollView.DecelerationRate.normal
        delegate = self
        
        panGestureRecognizer.delegate = self
        pinchGestureRecognizer?.delegate = self

        panGestureRecognizer.isEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SVGScrollView : SVGMacawViewDelegate {
    func getId(id: String?) {
        self.scrollViewDelegate?.getId(id: id)
    }
    
}

extension SVGScrollView : UIScrollViewDelegate {
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return svgView
    }

    public func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        self.svgView.contentScaleFactor = scale + 5
        self.svgView.layoutIfNeeded()
    }
}

extension SVGScrollView: UIGestureRecognizerDelegate {
    public override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let recognizer = gestureRecognizer as? UIPinchGestureRecognizer {
            let location = recognizer.location(in: self)
            let scale = Double(recognizer.scale)
            let anchor = Point(x: Double(location.x), y: Double(location.y))

            let node = self.svgView.node
            node.place = Transform.move(dx: anchor.x * (1.0 - scale), dy: anchor.y * (1.0 - scale)).scale(sx: scale, sy: scale)
        }

        return true
    }

    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
