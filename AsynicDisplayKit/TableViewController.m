//
//  TableViewController.m
//  AsynicDisplayKit
//
//  Created by 尹久盼 on 2017/10/15.
//  Copyright © 2017年 尹久盼. All rights reserved.
//

#import "TableViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "TableCellNode.h"
#import "TableItem.h"

@interface TableViewController ()<ASTableDataSource, ASTableDelegate>

/*
 * tableView
 */
@property(nonatomic, strong, nonnull) ASTableNode *tableNode;

/*
 * items
 */
@property(nonatomic, strong, nonnull) NSArray<TableItem *> *items;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self fetchData];
    
    // table Node 没有调用 -registerClass:forCellReuseIdentifier: 方法。
    self.tableNode = [ASTableNode new];
    self.tableNode.dataSource = self;
    self.tableNode.delegate = self;
    self.tableNode.frame = self.view.bounds;
    
    // 你不能添加一个 node 到 subview.
    // 这里要注意一个有趣的情况，你调用的是 UIView 的一个 -addSubnode: 方法，该方法是通过 category 添加到 UIView 上的.
    // 是唯一设置 table 的 separatorStyle 的一行代码。注意 tableNode 的 view 是如何访问 table 的 separatorStyle 属性的。ASTableNode 不会暴露所有 UITableView 的属性，所以你必须通过 tableNode 底层的 UITableView 实例去设置 UITableView 的特殊属性。
    [self.view addSubnode:self.tableNode];
    
    [self applyStyle];
    
    // 设置 leadingScreensForBatching 为 1.0 意味着当用户滑动一个屏的时候，就会载入新的数据。
    self.tableNode.leadingScreensForBatching = 1.0;
    
    [self.tableNode reloadData];
}

- (void)applyStyle {
    self.tableNode.view.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

- (void)fetchData {
    NSMutableArray *arrM = [NSMutableArray array];
    UIImage *avatarImage = [UIImage imageNamed:@"avatar"];
    NSInteger count = 30;
    for (int i = 0; i < count; i++) {
        NSAttributedString *nameAttributedText = [[NSAttributedString alloc] initWithString:@"NewPan" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18.f], NSForegroundColorAttributeName : [UIColor blackColor]}];
        NSAttributedString *titleAttributedText = [[NSAttributedString alloc] initWithString:@"逗比掌握核心科技" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16.f], NSForegroundColorAttributeName : [UIColor blackColor]}];
        TableItem *item = [[TableItem alloc] initWithNameAttributedText:nameAttributedText titleAttributedText:titleAttributedText avatarImage:avatarImage];
        [arrM addObject:item];
    }
    self.items = [arrM copy];
}

#pragma mark - ASTableDataSource

- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (ASCellNode *)tableNode:(ASTableNode *)tableNode nodeForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 使用 ASDK 不需要复用 cell.
    TableItem *item = self.items[indexPath.row];
    TableCellNode *node = [TableCellNode nodeWithItem:item];
    return node;
}


#pragma mark - ASTableDelegate

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"%s", __func__);
//}

// ASDK 中，所有的 ASCellNode 都负责确定自己的大小。你可以选择为单元格定义最小和最大尺寸，而不是提供静态高度.
- (ASSizeRange)tableNode:(ASTableNode *)tableNode constrainedSizeForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGSize min = CGSizeMake(width, 40);
    CGSize max = CGSizeMake(width, INFINITY);
    return ASSizeRangeMake(min, max);
}

- (BOOL)shouldBatchFetchForTableNode:(ASTableNode *)tableNode {
    // 该方法用于告诉 tableView 是否继续请求新的数据。如果返回 NO，则在到达 API 数据末尾时，不会再不会发出任何请求。
    return YES;
}

- (void)tableNode:(ASTableNode *)tableNode willBeginBatchFetchWithContext:(ASBatchContext *)context {
    // 该方法在用户滑动到 table 的末端并，且 -shouldBatchFetchForTableNode: 方法返回 YES 时被调用。
    // 加载下一页数据.
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self retrieveNextPageWithCompletion:^{
            
            [self insertNewRowsInTableNoinsertNewRowsInTableNode:tableNode];
            
        }];
        
    });
}


#pragma mark - FetchData

- (void)retrieveNextPageWithCompletion:(dispatch_block_t)completion {
    // 网络调用.
    if (completion) {
        completion();
    }
}

- (void)insertNewRowsInTableNoinsertNewRowsInTableNode:(ASTableNode *)node {
    // 在表中添加新的元素.
    NSMutableArray *arrM = [NSMutableArray arrayWithArray:self.items];
    UIImage *avatarImage = [UIImage imageNamed:@"avatar"];
    for (int i = 0; i < 10; i++) {
        NSAttributedString *nameAttributedText = [[NSAttributedString alloc] initWithString:@"NewPan" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18.f], NSForegroundColorAttributeName : [UIColor blackColor]}];
        NSAttributedString *titleAttributedText = [[NSAttributedString alloc] initWithString:@"逗比掌握核心科技" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16.f], NSForegroundColorAttributeName : [UIColor blackColor]}];
        TableItem *item = [[TableItem alloc] initWithNameAttributedText:nameAttributedText titleAttributedText:titleAttributedText avatarImage:avatarImage];
        [arrM addObject:item];
    }
    self.items = [arrM copy];
    [self.tableNode reloadData];
}

@end
