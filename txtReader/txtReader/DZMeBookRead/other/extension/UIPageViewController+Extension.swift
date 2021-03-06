//
//  UIPageViewController+Extension.swift

//
//  
//

private var IsGestureRecognizerEnabled = "IsGestureRecognizerEnabled"
private var TapIsGestureRecognizerEnabled = "TapIsGestureRecognizerEnabled"

import UIKit

extension UIPageViewController {

    /// 手势启用
    var gestureRecognizerEnabled:Bool {
        
        get{
            (objc_getAssociatedObject(self, &IsGestureRecognizerEnabled) as? Bool) ?? true
        }
        set{
            
            for ges in gestureRecognizers { ges.isEnabled = newValue }
            
            objc_setAssociatedObject(self, &IsGestureRecognizerEnabled, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    /// tap手势启用
    var tapGestureRecognizerEnabled:Bool {
        
        get{
            (objc_getAssociatedObject(self, &TapIsGestureRecognizerEnabled) as? Bool) ?? true   
        }
        set{
            
            for ges in gestureRecognizers {
                
                if ges.isKind(of: UITapGestureRecognizer.classForCoder()) { ges.isEnabled = newValue }
            }
            
            objc_setAssociatedObject(self, &TapIsGestureRecognizerEnabled, newValue , objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        }
    }
}
