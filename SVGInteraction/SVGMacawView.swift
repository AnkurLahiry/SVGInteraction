//
//  SVGMacawView.swift
//  SVGInteraction
//
//  Created by Ankur Lahiry on 6/12/19.
//  Copyright © 2019 Prefeex. All rights reserved.
//

import UIKit
import Macaw
import SWXMLHash

protocol SVGMacawViewDelegate {
    func getId(id : String?)
}

class SVGMacawView: MacawView {

    var delegate : SVGMacawViewDelegate?
    
    private var pathArray = [String]()
    
    init(template: String, frame : CGRect) {
        super.init(frame : frame)
        self.backgroundColor = .white
        if let node = try? SVGParser.parse(resource: template, ofType: "svg", inDirectory: nil, fromBundle: Bundle.main) {
            if let group = node as? Group {
                let rect = Rect.init(x: 1, y: 1, w: 4000, h: 4000)
                let backgroundShape = Shape(form: rect, fill: Color.clear, tag: ["back"])
                var contents = group.contents
                contents.insert(backgroundShape, at: 0)
                group.contents = contents
                self.node = group
                if let url = Bundle.main.url(forResource: template, withExtension: "svg") {
                    if let xmlString = try? String(contentsOf: url) {
                        let xml = SWXMLHash.parse(xmlString)
                        enumerate(indexer: xml, level: 0)
                        for case let element in pathArray {
                            self.registerForSelection(nodeTag: element)
                        }
                    }
                }
            } else {
                self.node = node
            }

            // layout
            self.contentMode = .center
        }
    }
    
    private func enumerate(indexer: XMLIndexer, level: Int) {
        for child in indexer.children {
            if let element = child.element {
                if let idAttribute = element.attribute(by: "id") {
                    let text = idAttribute.text
                    pathArray.append(text)
                }
            }
            enumerate(indexer: child, level: level + 1)
        }
    }
    
    private func registerForSelection(nodeTag : String) {
        self.node.nodeBy(tag: nodeTag)?.onTouchPressed({ (touch) in
            let nodeShape = self.node.nodeBy(tag: nodeTag) as! Shape
            nodeShape.fill = Color.blue
            self.delegate?.getId(id: nodeTag)
        })
    }
    
    
    @objc required convenience init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
