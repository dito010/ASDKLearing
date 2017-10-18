//
//  TableItem.h
//  AsynicDisplayKit
//
//  Created by 尹久盼 on 2017/10/15.
//  Copyright © 2017年 尹久盼. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableItem : NSObject

/*
 * avatar.
 */
@property(nonatomic, strong, nonnull) UIImage *avatar;

/*
 * attributedText.
 */
@property(nonatomic, strong, nonnull) NSAttributedString *attributedText;

- (instancetype)initWithAttributedText:(NSAttributedString *)attributedText avatar:(UIImage *)avatar;

@end

NS_ASSUME_NONNULL_END
