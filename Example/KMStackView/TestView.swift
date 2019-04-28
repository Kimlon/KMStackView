//
//  TestView.swift
//  KMStackView
//
//  Created by 袁金龙 on 2019/4/28.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class TestView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    private var _h: CGFloat = CGFloat.random(in: 60..<160)
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 0, height: _h)
    }
}

extension TestView {
    
    
    func changeHeight() -> Void {
        _h += 50
        invalidateIntrinsicContentSize()
    }
    
    private func setupSubviews() -> Void {
        
        let r = Int.random(in: 0...255)
        let g = Int.random(in: 0...255)
        let b = Int.random(in: 0...255)
        
        backgroundColor = kRGBA(r: r, g: g, b: b, a: 1)
    }
}
