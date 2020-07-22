//
//  DZMRMSpacingView.swift

//
//  
//

import UIKit

class DZMRMSpacingView: DZMRMBaseView {

    private var spacingIcons:[String] = ["spacing_0","spacing_1","spacing_2"]
    
    private var items:[DZMRMSpacingItem] = []
    
    private var selectItem:DZMRMSpacingItem!
    
    override init(frame: CGRect) { super.init(frame: frame) }
    
    override func addSubviews() {
        
        super.addSubviews()
        
        backgroundColor = UIColor.clear
        
        let count = spacingIcons.count
        
        for i in 0..<count {
            
            let spacingIcon = spacingIcons[i]
            
            let item = DZMRMSpacingItem(type: .custom)
            item.tag = i
            item.layer.cornerRadius = SPACE_SA_6
            item.layer.borderColor = READ_COLOR_MENU_COLOR.cgColor
            item.layer.borderWidth = SPACE_SA_1
            item.titleLabel?.font = FONT_SA_12
            item.setImage(UIImage(named: spacingIcon)!.withRenderingMode(.alwaysTemplate), for: .normal)
            item.tintColor = READ_COLOR_MENU_COLOR
            item.addTarget(self, action: #selector(clickItem(_:)), for: .touchUpInside)
            addSubview(item)
            items.append(item)
            
            if i == DZMReadConfigure.shared.spacingIndex.intValue { selectItem(item) }
        }
    }
    
    private func selectItem(_ item:DZMRMSpacingItem) {
        
        selectItem?.tintColor = READ_COLOR_MENU_COLOR
        selectItem?.layer.borderColor = READ_COLOR_MENU_COLOR.cgColor
        
        item.tintColor = READ_COLOR_MAIN
        item.layer.borderColor = READ_COLOR_MAIN.cgColor
        
        selectItem = item
    }
    
    @objc private func clickItem(_ item:DZMRMSpacingItem) {
        
        if selectItem == item { return }
        
        selectItem(item)
        
        DZMReadConfigure.shared.spacingIndex = NSNumber(value: item.tag)
        
        DZMReadConfigure.shared.save()
        
        readMenu?.delegate?.readMenuClickSpacing(readMenu: readMenu)
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        let count = spacingIcons.count
        
        let w = frame.size.width
        let h = frame.size.height
        
        let itemW = SPACE_SA_70
        let itemH = SPACE_SA_30
        let itemY = (h - itemH) / 2
        let itemSpaceW = (w - CGFloat(count) * itemW) / (CGFloat(count - 1))
        
        for i in 0..<count {
            
            let item = items[i]
            item.frame = CGRect(x: CGFloat(i) * (itemW + itemSpaceW), y: itemY, width: itemW, height: itemH)
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}

private class DZMRMSpacingItem:UIButton {
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        
        return CGRect(x: (contentRect.width - SPACE_SA_25) / 2, y: (contentRect.height - SPACE_SA_20) / 2, width: SPACE_SA_25, height: SPACE_SA_20)
    }
}
