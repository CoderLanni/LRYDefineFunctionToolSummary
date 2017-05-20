//
//  UIImage+YJImage.m
//  YJTabBarPer
//
//  Created by houdage on 15/11/17.
//  Copyright © 2015年 YJHou. All rights reserved.
//

#import "UIImage+YJImage.h"

@implementation UIImage (YJImage)

+ (instancetype)imageWithOriginalName:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


+ (instancetype)imageWithStretchableName:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

@end
