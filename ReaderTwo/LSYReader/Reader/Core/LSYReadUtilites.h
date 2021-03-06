//
//  LSYReadUtilites.h
//  LSYReader
//
//  Created by Labanotation on 16/5/31.
//  Copyright © 2016年 okwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSYReadUtilites : NSObject


+(NSMutableArray *)separateChapter:(NSString *)content;




+(NSString *)encodeWithURL:(NSURL *)url;
+(UIButton *)commonButtonSEL:(SEL)sel target:(id)target;
+(UIViewController *)getCurrentVC;
+(void)showAlertTitle:(NSString *)title content:(NSString *)string;

@end
