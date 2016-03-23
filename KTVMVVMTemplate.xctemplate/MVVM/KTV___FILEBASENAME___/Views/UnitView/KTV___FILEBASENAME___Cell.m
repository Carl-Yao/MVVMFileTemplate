//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "KTV___FILEBASENAME___Cell.h"
#import "UIColor+Addition.h"
#import "KTVBaseViewController.h"
#import "UIView+ExtendView.h"
#import "KGStatisticsAgent.h"
#import "KTV___FILEBASENAME___Info.h"

@interface KTV___FILEBASENAME___Cell ()<KTV___FILEBASENAME___CellProtocol>
{
    NSInteger curIndex;
}
@end

@implementation KTV___FILEBASENAME___Cell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    [self layoutIfNeeded];
}

-(void)updateCellWithData:(KTV___FILEBASENAME___Info*) info index:(NSInteger)index
{
}

@end
