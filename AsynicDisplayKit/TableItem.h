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
@property(nonatomic, strong, nonnull) UIImage *avatarImage;

/*
 * nameAttributedText.
 */
@property(nonatomic, copy, nonnull) NSAttributedString *nameAttributedText;

/*
 * titleAttributedText.
 */
@property(nonatomic, copy, nonnull) NSAttributedString *titleAttributedText;

- (instancetype)initWithNameAttributedText:(NSAttributedString *)nameAttributedText
                       titleAttributedText:(NSAttributedString *)titleAttributedText
                               avatarImage:(UIImage *)avatarImage;

@end

NS_ASSUME_NONNULL_END
