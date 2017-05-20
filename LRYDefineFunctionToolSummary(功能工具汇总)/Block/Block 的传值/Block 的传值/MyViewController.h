//
//  MyViewController.h
//  Block 的传值
//
//  Created by ZE KANG on 2017/5/15.
//  Copyright © 2017年 LRY. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  定义了一个changeColor的Block。这个changeColor必须带一个参数，这个参数的类型必须为id类型的
 *  无返回值
 *  @param id
 */
typedef void(^ChangeColor)(id);

@interface MyViewController : UIViewController

/**
 *  用上面定义的changeColor声明一个Block,声明的这个Block必须遵守声明的要求。
 */
@property (nonatomic, copy) ChangeColor backgroundColor;





///**
// *  无参数无返回值的Block
// */
//-(void)func1{
//    /**
//     *  void ：就是无返回值
//     *  emptyBlock：就是该block的名字
//     *  ()：这里相当于放参数。由于这里是无参数，所以就什么都不写
//     */
//    void (^emptyBlock)() = ^(){
//        NSLog(@"无参数,无返回值的Block");
//    };
//    emptyBlock();
//}





///**
// *  调用这个block进行两个参数相加
// *
// *  @param int 参数A
// *  @param int 参数B
// *
// *  @return 无返回值
// */
//void (^sumBlock)(int ,int ) = ^(int a,int b){
//    NSLog(@"%d + %d = %d",a,b,a+b);
//};
///**
// *  调用这个sumBlock的Block，得到的结果是20
// */
//sumBlock(10,10);




///**
// *  有参数有返回值
// *
// *  @param NSString 字符串1
// *  @param NSString 字符串2
// *
// *  @return 返回拼接好的字符串3
// */
//NSString* (^logBlock)(NSString *,NSString *) = ^(NSString * str1,NSString *str2){
//    return [NSString stringWithFormat:@"%@%@",str1,str2];
//};
////调用logBlock,输出的是 我是Block
//NSLog(@"%@", logBlock(@"我是",@"Block"));



@end
