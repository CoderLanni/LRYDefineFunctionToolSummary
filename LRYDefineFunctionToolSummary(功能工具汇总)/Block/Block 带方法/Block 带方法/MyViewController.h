//
//  MyViewController.h
//  Block 带方法
//
//  Created by ZE KANG on 2017/5/15.
//  Copyright © 2017年 LRY. All rights reserved.
//


/**
 带参数才需要- setter方法
 */


#import <UIKit/UIKit.h>


typedef void (^ReturnTextBlock)(NSString *showText);

/**
 //第二种方法
typedef void (^MyBlock)(id);
*/


@interface MyViewController : UIViewController

@property (nonatomic, copy) ReturnTextBlock returnTextBlock;

- (void)returnText:(ReturnTextBlock)block;

/**
 //第二种方法
@property(nonatomic, copy) MyBlock myBlock;
*/


@end
