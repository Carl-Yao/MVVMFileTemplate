//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

___IMPORTHEADER_cocoaSubclass___
#import "KTVEmptyView.h"
#import "KGDefaultNetErrorView.h"
#import "KTVCommonTableViewRE.h"
#import "KTV___FILEBASENAME___Info.h"

@protocol KTV___FILEBASENAME___ViewEventDelegate;
@protocol KTV___FILEBASENAME___ViewDataSource;

@interface KTV___FILEBASENAME___View: UIView<KTVTableViewDelegate,KTVTableViewDataSource>
//___VARIABLE_cocoaSubclass___
@property (nonatomic, strong) KTVCommonTableViewRE * tableView;
@property (nonatomic, weak) id<KTV___FILEBASENAME___ViewEventDelegate> delegate;
@property (nonatomic, weak) id<KTV___FILEBASENAME___ViewDataSource> dataSource;
@property (nonatomic, strong) KTVEmptyView * emptyView;
@property (nonatomic, strong) KGDefaultNetErrorView * netErrorView;

- (void)reflash:(BOOL)success;
- (void)dismissEmpty;
- (void)showEmpty;
- (void)dismissNetError;
- (void)showNetError;
@end

@protocol KTV___FILEBASENAME___ViewEventDelegate <NSObject>
- (void)my___FILEBASENAME___ViewShouldReflashData;
- (void)my___FILEBASENAME___ViewShouldLoadMoreData;
@end

@protocol KTV___FILEBASENAME___ViewDataSource <NSObject>
@required
- (NSInteger)numberOf___FILEBASENAME___;
- (KTV___FILEBASENAME___Info *)my___FILEBASENAME___ItemAtIndex:(NSInteger)index;
- (void)delete___FILEBASENAME___ItemAtIndex:(NSInteger)index;
- (BOOL)haveMoreDataDynamicMessage;
- (void)addMyMessageItems:(NSMutableArray*) array;
@end
