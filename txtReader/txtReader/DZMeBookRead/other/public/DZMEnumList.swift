//
//  DZMEnumList.swift

//
//  
//

import UIKit



/// 阅读翻页类型
enum DZMEffectType:NSInteger {
    /// 仿真
    case simulation
    /// 平移
    case translation
    /// 滚动
    case scroll
    /// 无效果
    case no
}

/// 阅读字体类型
enum DZMFontType:NSInteger {
    /// 系统
    case system
    /// 黑体
    case one
    /// 楷体
    case two
    /// 宋体
    case three
}

/// 阅读内容间距类型
enum DZMSpacingType:NSInteger {
    /// 大间距
    case big
    /// 适中间距
    case middle
    /// 小间距
    case small
}

/// 阅读进度类型
enum DZMProgressType:NSInteger {
    /// 总进度
    case total
    /// 分页进度
    case page
}

/// 分页内容是以什么开头
enum DZMPageHeadType: Int {
    /// 章节名
    case chapterName
    /// 段落
    case paragraph
    /// 行内容
    case line
}
