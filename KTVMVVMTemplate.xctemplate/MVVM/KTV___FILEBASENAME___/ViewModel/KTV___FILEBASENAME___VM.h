//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "KFViewModelObject.h"
#import "KTV___FILEBASENAME___Info.h"

@interface KTV___FILEBASENAME___VM: KFViewModelObject
@property (assign, nonatomic) BOOL isFresh;
@property (nonatomic, assign) BOOL haveMoreData;  ///<是否有更多数据（还有新的分页）

- (NSInteger)numberOf___FILEBASENAME___;
- (KTV___FILEBASENAME___Info *)my___FILEBASENAME___ItemAtIndex:(NSInteger)index;
- (void)delete___FILEBASENAME___ForIndex:(NSInteger)index;
- (void)update;
- (void)loadMore;

@end
