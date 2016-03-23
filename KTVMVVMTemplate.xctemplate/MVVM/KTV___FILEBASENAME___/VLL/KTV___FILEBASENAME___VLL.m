//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "KTV___FILEBASENAME___VLL.h"

@interface KTV___FILEBASENAME___VLL ()

@end

@implementation KTV___FILEBASENAME___VLL
#pragma mark - KTV___FILEBASENAME___ViewDataSource
- (NSInteger)numberOf___FILEBASENAME___
{
    return [self.viewModel numberOf___FILEBASENAME___];
}

- (KTV___FILEBASENAME___Info *)my___FILEBASENAME___ItemAtIndex:(NSInteger)index
{
    return [self.viewModel my___FILEBASENAME___ItemAtIndex:index];
}

- (void)delete___FILEBASENAME___ItemAtIndex:(NSInteger)index
{
    [self.viewModel delete___FILEBASENAME___ForIndex:index];
}

- (BOOL)haveMoreData___FILEBASENAME___
{
    BOOL result = NO;
    
    result = self.viewModel.haveMoreData;
    
    return result;
}

#pragma mark - KTVKTV___FILEBASENAME___ViewEventDelegate
- (void)my___FILEBASENAME___ViewShouldReflashData
{
    if ([self.viewModel numberOf___FILEBASENAME___] <= 0) {
        //没有数据，不需要提示
        KFResourceConfig * config = [[KFResourceConfig alloc] init];
        config.needErrorPostNotify = NO;
        [self.viewModel setResourceConfig:config forAction:@selector(update)];
    }
    
    [self.viewModel update];
}

- (void)my___FILEBASENAME___ViewShouldLoadMoreData;
{
    [self.viewModel loadMore];
}

@end
