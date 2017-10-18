//
//  TableItem.m
//  AsynicDisplayKit
//
//  Created by 尹久盼 on 2017/10/15.
//  Copyright © 2017年 尹久盼. All rights reserved.
//

#import "TableItem.h"

@implementation TableItem

- (instancetype)initWithAttributedText:(NSAttributedString *)attributedText avatar:(nonnull UIImage *)avatar {
    self = [super init];
    if (self) {
        self.attributedText = attributedText;
        self.avatar = avatar;
    }
    return self;
}

@end
