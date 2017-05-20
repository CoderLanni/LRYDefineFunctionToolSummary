//
//  UIImage+JZ.m
//  我的微博
//
//  Created by peijz on 16/1/4.
//  Copyright © 2016年 peijz. All rights reserved.
//

#import "UIImage+JZ.h"

@implementation UIImage (JZ)
+(UIImage *)imageWithNamed:(NSString *)name
{
    // 是iOS7 返回的图片
//    if (iOS7)
//    {
//        NSString * imageName = [name stringByAppendingString:@"_os7"];
//        UIImage * image = [UIImage imageNamed:imageName];
//        if (image == nil) { // 没有ios7的图片
//            image = [UIImage imageNamed:name];
//        }
//        return image;
//    }
    // 不是iOS7下返回的图片
    return [UIImage imageNamed:name];
}
+(UIImage *)resizeImageWithName:(NSString *)name
{
    UIImage * image = [UIImage imageWithNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
@end
