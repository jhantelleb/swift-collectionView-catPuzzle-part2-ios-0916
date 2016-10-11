//
//  Extensions.swift
//  CollectionViewCats
//
//  Created by Joel Bell on 10/3/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

extension UIFont {
    
    class func helveticaNeueBold(size: CGFloat) -> UIFont { return UIFont(name: "HelveticaNeue-Bold", size: size)! }
    class func helveticaNeueLight(size: CGFloat) -> UIFont { return UIFont(name: "HelveticaNeue-Light", size: size)! }
    class func helveticaNeueUltraLight(size: CGFloat) -> UIFont { return UIFont(name: "HelveticaNeue-UltraLight", size: size)! }
    class func helveticaNeueLightItalic(size: CGFloat) -> UIFont { return UIFont(name: "HelveticaNeue-LightItalic", size: size)! }
    class func helveticaNeueCondensedBold(size: CGFloat) -> UIFont { return UIFont(name: "HelveticaNeue-CondensedBold", size: size)! }
    
}

//from EnumsFun Lab
extension MutableCollection where Indices.Iterator.Element == Index {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (unshuffledCount, firstUnshuffled) in zip(stride(from: c, to: 1, by: -1), indices) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            guard d != 0 else { continue }
            let i = index(firstUnshuffled, offsetBy: d)
            swap(&self[firstUnshuffled], &self[i])
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Iterator.Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}
