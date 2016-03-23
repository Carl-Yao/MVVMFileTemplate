//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "KTV___FILEBASENAME___VM.h"

@interface KTV___FILEBASENAME___VM ()
@property (nonatomic, assign) int32_t pageNo;
@property (nonatomic, assign) int32_t pageSize;
//@property (nonatomic, strong) KTV___FILEBASENAME___DManager * listDM;
@property (nonatomic, strong) KTV___FILEBASENAME___HttpDAO *httpDao;
@property (nonatomic, strong) NSMutableArray * my___FILEBASENAME___List;

@end

@implementation KTV___FILEBASENAME___VM

- (id)init
{
    self = [super init];
    if (self) {
        _pageNo = 1;
        _pageSize = 20;
        _my___FILEBASENAME___List = [[NSMutableArray alloc] init];
//        _listDM = [[KTV___FILEBASENAME___DManager alloc] init];
        _httpDao = [[KTVChorusListHttpDAO alloc] init];
        self.haveMoreData = NO;
    }
    return self;
}
- (void)update
{
    /**
     *  开始更新时，给一个状态给绑定者
     */
    if (self.updateBlock)
    {
        self.updateBlock();
    }
    
    KFResourceConfig * requestConfig = [self resourceConfigForAction:@selector(update)];
    if (requestConfig) {
        [self.httpDao setResourceConfig:requestConfig forAction:@selector(async___FILEBASENAME___ListWithPageSize:page:pageSize:succeed:failed:)];
    }
    
    __weak KTV___FILEBASENAME___VM* weakSelf = self;
    self.pageNo = 1;
    
    [self.httpDao async___FILEBASENAME___ListWithPageSize:PAGESIZE page:self.pageNo pageSize:self.pageSize succeed:^(NSArray *list) {

        [weakSelf handleUpdateSuccess:list];
        
        if (weakSelf.completionBlock) {
            weakSelf.completionBlock (YES);
        }
        
    } failed:^(NSError *error) {
        if (weakSelf.completionBlock) {
            weakSelf.completionBlock(NO);
        }
    }];
    
}
- (void)loadMore
{
    KFResourceConfig * requestConfig = [self resourceConfigForAction:@selector(update)];
    if (requestConfig) {
        [self.httpDao setResourceConfig:requestConfig forAction:@selector(async___FILEBASENAME___ListWithPageSize:page:pageSize:succeed:failed:)];
    }
    
    __weak KTV___FILEBASENAME___VM * weakSelf = self;
    [self.httpDao async___FILEBASENAME___ListWithPageSize:PAGESIZE page:self.pageNo pageSize:self.pageSize succeed:^(NSArray *list) {
        
        [weakSelf handleLoadMoreSuccess:list];
        
        //更新成功时，返回给绑定者
        if (weakSelf.completionBlock) {
            weakSelf.completionBlock(YES);
        }
        
    } fail:^{
        //更新失败时，返回给绑定者
        if (weakSelf.completionBlock) {
            weakSelf.completionBlock(NO);
        }
    }];
}

- (NSInteger)numberOf___FILEBASENAME___;
{
    return [self.my___FILEBASENAME___List count];
}
/**
 *  更新数据成功的处理
 */
- (void)handleUpdateSuccess:(NSArray*)list
{
    if(self.my___FILEBASENAME___List.count > 0)
    {
        [self.my___FILEBASENAME___List removeAllObjects];
    }
    
    [self handleLoadMoreSuccess:list];
}

/**
 *  获取更多数据成功的处理
 */
- (void)handleLoadMoreSuccess:(NSArray*)list
{
    for (NSInteger i = 0; i < [list count]; i ++)
    {
        /**
         *  取得模型
         */
        KTV___FILEBASENAME___Info* info = [list objectAtIndex:i];
        info = [list objectAtIndex:i];
        [self.my___FILEBASENAME___List addObject:info];
    }
    
    _pageNo++;
    
    if ([list count] >= self.pageSize) {
        self.haveMoreData = YES;
    }
    else {
        self.haveMoreData = NO;
    }
    
}

- (KTV___FILEBASENAME___Info *)my___FILEBASENAME___ItemAtIndex:(NSInteger)index
{
    KTV___FILEBASENAME___Info * item = nil;
    if (index >= 0 && index < [self.my___FILEBASENAME___List count]) {
        item = [self.my___FILEBASENAME___List objectAtIndex:index];
    }
    return item;
}

-(void)delete___FILEBASENAME___ForIndex:(NSInteger)index
{
    if (index < [self.my___FILEBASENAME___List count] && index >= 0){
        [self.my___FILEBASENAME___List removeObjectAtIndex:index];
    }
}

@end
