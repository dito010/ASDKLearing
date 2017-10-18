//
//  TableCellNode.h
//  AsynicDisplayKit
//
//  Created by 尹久盼 on 2017/10/15.
//  Copyright © 2017年 尹久盼. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@class TableItem;

@interface TableCellNode : ASCellNode

- (instancetype)initWithItem:(TableItem *)item;

+ (instancetype)nodeWithItem:(TableItem *)item;

@end
