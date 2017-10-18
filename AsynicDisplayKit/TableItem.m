//
//  TableItem.m
//  AsynicDisplayKit
//
//  Created by 尹久盼 on 2017/10/15.
//  Copyright © 2017年 尹久盼. All rights reserved.
//

#import "TableItem.h"

@implementation TableItem

- (instancetype)initWithNameAttributedText:(NSAttributedString *)nameAttributedText
                       titleAttributedText:(NSAttributedString *)titleAttributedText
                               avatarImage:(UIImage *)avatarImage {
    self = [super init];
    if (self) {
        _nameAttributedText = nameAttributedText;
        _titleAttributedText = titleAttributedText;
        _avatarImage = avatarImage;
    }
    return self;
}

@end
