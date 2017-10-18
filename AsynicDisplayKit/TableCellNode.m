//
//  TableCellNode.m
//  AsynicDisplayKit
//
//  Created by 尹久盼 on 2017/10/15.
//  Copyright © 2017年 尹久盼. All rights reserved.
//

#import "TableCellNode.h"
#import "TableItem.h"

@interface TableCellNode()

/*
 * textNode.
 */
@property(nonatomic, strong, nonnull) ASTextNode *textNode;

/*
 * ImageNode
 */
@property(nonatomic, strong, nonnull) ASImageNode *imageNode;

@end

@implementation TableCellNode

- (instancetype)initWithItem:(TableItem *)item {
    self = [super init];
    if (self) {
        self.imageNode = ({
            ASImageNode *node = [ASImageNode new];
//            node.frame = CGRectMake(10, 10, 40, 40);
            [self addSubnode:node];
            node.image = item.avatar;
            
            node;
        });
        
        self.textNode = ({
            ASTextNode *node = [ASTextNode new];
            node.attributedText = item.attributedText;
//            node.frame = CGRectMake(60, 10, 200, 40);
            [self addSubnode:node];
            
            node;
        });
    }
    return self;
}

+ (instancetype)nodeWithItem:(TableItem *)item {
    return [[TableCellNode alloc] initWithItem:item];
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
    ASStackLayoutSpec *spec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:20.f justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[self.imageNode, self.textNode]];
    ASInsetLayoutSpec *insetLayoutSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 0) child:spec];
    return insetLayoutSpec;
    
}

@end
