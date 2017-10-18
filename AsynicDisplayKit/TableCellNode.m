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
 * nameNode.
 */
@property(nonatomic, strong, nonnull) ASTextNode *nameNode;


/*
 * titleNode.
 */
@property(nonatomic, strong, nonnull) ASTextNode *titleNode;

/*
 * ImageNode
 */
@property(nonatomic, strong, nonnull) ASImageNode *avatarNode;

@end

const CGFloat kTableCellNodeInsetsMargin = 16;
const CGFloat kTableCellNodeInnerPadding = 20;
@implementation TableCellNode

- (instancetype)initWithItem:(TableItem *)item {
    self = [super init];
    if (self) {
        self.avatarNode = ({
            ASImageNode *node = [ASImageNode new];
            [self addSubnode:node];
            node.image = item.avatarImage;
            
            node;
        });
        
        self.nameNode = ({
            ASTextNode *node = [ASTextNode new];
            node.attributedText = item.nameAttributedText;
            [self addSubnode:node];
            
            node;
        });
        
        self.titleNode = ({
            ASTextNode *node = [ASTextNode new];
            node.attributedText = item.titleAttributedText;
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
    ASStackLayoutSpec *vSpec = [ASStackLayoutSpec new];
    vSpec.direction = ASStackLayoutDirectionVertical;
    vSpec.spacing = kTableCellNodeInnerPadding;
    [vSpec setChildren:@[self.nameNode, self.titleNode]];
    ASStackLayoutSpec *hSpec = [ASStackLayoutSpec new];
    hSpec.direction = ASStackLayoutDirectionHorizontal;
    hSpec.spacing = kTableCellNodeInnerPadding;
    [hSpec setChildren:@[self.avatarNode, vSpec]];
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(kTableCellNodeInsetsMargin, kTableCellNodeInsetsMargin, kTableCellNodeInsetsMargin, kTableCellNodeInsetsMargin) child:hSpec];
}

@end
