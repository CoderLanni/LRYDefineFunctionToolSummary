//
//  TestCustomView.m
//  TestCustomViewFromXib
//
//  Created by Eunice_Wang on 14/11/26.
//  Copyright (c) 2014年 Enuice_Wang. All rights reserved.
//

#import "TestCustomView.h"

@implementation TestCustomView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSString *className = NSStringFromClass([self class]);
        self.view = [[[NSBundle mainBundle] loadNibNamed:className owner:self options:nil] firstObject];
        [self addSubview:self.view];
        return self;
    }
    return nil;
}

@end
