//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "KTV___FILEBASENAME___View.h"
#import "KTVCommonTableViewRE.h"
#import "UIColor+Addition.h"
#import "KTV___FILEBASENAME___Cell.h"
#import "KTVBaseViewController.h"
#import "UIView+ExtendView.h"
#import "KGStatisticsAgent.h"
#import "KTV___FILEBASENAME___Info.h"

@interface KTV___FILEBASENAME___View ()<KTV___FILEBASENAME___CellProtocol>
{
    NSInteger curIndex;
    KTV___FILEBASENAME___Info *curInfo;
}
@end

@implementation KTV___FILEBASENAME___View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tableView = [[KTVCommonTableViewRE alloc] initWithFrame:self.bounds style:UITableViewStylePlain haveReflashHead:YES isStartRequest:NO];
        [self addSubview:self.tableView];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    return self;
}

- (void)reflash:(BOOL)success
{
    [self.tableView endRefreshing];
    
    /**
     *  刷新数据
     */
    [self.tableView reloadData];
    
    /**
     *  刷新结束为加载更多做配置
     */
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(haveMoreDataDynamicMessage)]) {
        BOOL haveMore = [self.dataSource haveMoreDataDynamicMessage];
        [self.tableView isShowLoadMoreView:haveMore];
    }
}

#pragma mark - KTVTableViewDataSource

- (NSInteger)ktvTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource numberOf___FILEBASENAME___];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)ktvTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KTV___FILEBASENAME___Info* info = [self.dataSource my___FILEBASENAME___ItemAtIndex:indexPath.row];
    KTV___FILEBASENAME___Cell* cell;

    NSString * indentify = @"my___FILEBASENAME___Cell";
    cell = [tableView dequeueReusableCellWithIdentifier:indentify];
    if (!cell) {
        cell = [[KTV___FILEBASENAME___Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentify];
        
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell updateCellWithData:info index:indexPath.row];
    return cell;
}

#pragma mark - KTVTableViewDelegate
- (void)ktvTableView:(UITableView *)tableView startAsyncRequestData:(BOOL)isFresh
{
    if (isFresh && ![self.tableView isPullDownReflesh]) {
        return;//屏蔽创建tableview时的刷新
    }
    
    if (isFresh) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(my___FILEBASENAME___ViewShouldReflashData)]) {
            [self.delegate my___FILEBASENAME___ViewShouldReflashData];
        }
    } else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(my___FILEBASENAME___ViewShouldLoadMoreData)]) {
            [self.delegate my___FILEBASENAME___ViewShouldLoadMoreData];
        }
    }
}

- (CGFloat)ktvTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KTV___FILEBASENAME___Info* info = [self.dataSource my___FILEBASENAME___ItemAtIndex:indexPath.row];
    
    return 60;
}

- (void)ktvTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

#pragma mark - 页面异常提示相关
- (void)showNetError
{
    if (self.netErrorView)
    {
        [self dismissNetError];
    }
    
    if (!self.netErrorView) {
        self.netErrorView = [[KGDefaultNetErrorView alloc] initWithFrame:self.tableView.bounds];
    }
    
    [self.tableView addSubview:self.netErrorView];
}

- (void)dismissNetError
{
    if (self.netErrorView) {
        [self.netErrorView removeFromSuperview];
        self.netErrorView = nil;
    }
}

- (void)showEmpty
{
    if (self.emptyView) {
        [self dismissEmpty];
    }
    if (! self.emptyView) {
        NSString * text = nil;
        NSString * imageName = nil;
        imageName = @"ktv_MyKCoin_HistoryTopUp_nodata";
        
        text = @"空数据文案";
        
        self.emptyView = [[KTVEmptyView alloc] initWithFrame:CGRectMake(0, self.tableView.height / 2 - 95, CGRectGetWidth(self.tableView.bounds), 165)
                                                       image:[UIImage imageNamed:imageName]
                                                       title:nil
                                                        text:text];
        
    }
    [self.tableView addSubview:self.emptyView];
}

- (void)dismissEmpty
{
    if (self.emptyView) {
        [self.emptyView removeFromSuperview];
        self.emptyView = nil;
    }
}

#pragma mark - KTV___FILEBASENAME___CellProtocal

@end
