//
//  UIImage+JZ.h
//  我的微博
//
//  Created by peijz on 16/1/4.
//  Copyright © 2016年 peijz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JZ)
+(UIImage *)imageWithNamed:(NSString *)name;
/**
 * 返回一张自由拉伸的图片
 */
+(UIImage *)resizeImageWithName:(NSString *)name;
@end
