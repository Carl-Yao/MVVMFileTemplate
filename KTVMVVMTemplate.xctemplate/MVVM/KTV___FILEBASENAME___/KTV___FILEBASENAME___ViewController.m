//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "KTV___FILEBASENAME___ViewController.h"
#import "KTV___FILEBASENAME___View.h"
#import "KTV___FILEBASENAME___VLL.h"
#import "KTV___FILEBASENAME___VM.h"
#import "UIColor+Addition.h"
#import "KGViewController.h"
#import "KGStatisticsAgent.h"
#import "UIScrollView+ScrollsToTop.h"

@interface KTV___FILEBASENAME___ViewController ()<KTV___FILEBASENAME___VLLDelegate>
@property (nonatomic, strong) KTV___FILEBASENAME___View *my___FILEBASENAME___View;
@property (nonatomic, strong) KTV___FILEBASENAME___VLL *my___FILEBASENAME___VLL;
@property (nonatomic, strong) KTV___FILEBASENAME___VM *my___FILEBASENAME___VM;
@end

@implementation KTV___FILEBASENAME___ViewController

#pragma mark - def

#pragma mark - override
- (void)viewDidLoad
{
    [super viewDidLoad];
    KGThemeImageView *bg = [KGThemeImageView imageViewWithType:KGThemeImageType_ContentBg];
    bg.frame = self.view.bounds;
    [self.view addSubview:bg];
    
    self.setType = KG_SETVIEW_TYPE_KTV;
    KGDefaultTopView *dtopView = (KGDefaultTopView *)self.KGNavigationController.topView;
    dtopView.rightItems = nil;
    self.disableLeftScroll = YES;
    
    //to do
    self.title = @"标题";
    
    self.my___FILEBASENAME___View = [[KTV___FILEBASENAME___View alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - dtopView.height)];
    self.my___FILEBASENAME___VLL = [[KTV___FILEBASENAME___VLL alloc] init];
    self.my___FILEBASENAME___VM = [[KTV___FILEBASENAME___VM alloc] init];
    self.my___FILEBASENAME___View.delegate = self.my___FILEBASENAME___VLL;
    self.my___FILEBASENAME___View.dataSource = self.my___FILEBASENAME___VLL;
    self.my___FILEBASENAME___VLL.delegate = self;
    self.my___FILEBASENAME___VLL.viewModel = self.my___FILEBASENAME___VM;
    [self.view addSubview:self.my___FILEBASENAME___View];
    __weak KTV___FILEBASENAME___ViewController * weakSelf = self;
    self.my___FILEBASENAME___VM.updateBlock = ^(void){
        
    };
    self.my___FILEBASENAME___VM.completionBlock = ^(BOOL success){
        
        [[KGProgressView windowProgressView] dismissWithStatus:nil icon:nil afterDelay:0.0f];
        
        [weakSelf.my___FILEBASENAME___View reflash:success];
        
        if (success) {
            
            [weakSelf.my___FILEBASENAME___View dismissNetError];
            [weakSelf.my___FILEBASENAME___View dismissEmpty];
            
            if ([weakSelf.my___FILEBASENAME___VM numberOf___FILEBASENAME___] <= 0) {
                //为空
                [weakSelf.my___FILEBASENAME___View showEmpty];
            }
        }
        else
        {
            if ([weakSelf.my___FILEBASENAME___VM numberOf___FILEBASENAME___] <= 0) {
                //网络问题
                [weakSelf.my___FILEBASENAME___View showNetError];
            }
        }
    };
    
    [[KGProgressView windowProgressView] showWithStatus:@"加载中,请稍后" maskType:KGProgressViewMaskTypeClear|KGProgressViewTypeBlackTextColor];
    
    [self.my___FILEBASENAME___VM update];
    
}

#pragma ___FILEBASENAME___VLLDelegate

@end
