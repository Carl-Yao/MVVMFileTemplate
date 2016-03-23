//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import <UIKit/UIKit.h>
#import "KTV___FILEBASENAME___Info.h"
#import "KFCommedTableViewCell.h"

@class KTV___FILEBASENAME___Cell;
@protocol KTV___FILEBASENAME___CellProtocol <NSObject>
//to do
@end

@interface KTV___FILEBASENAME___Cell: KFCommedTableViewCell

@property(nonatomic, weak) id<KTV___FILEBASENAME___CellProtocol> delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
-(void)updateCellWithData:(KTV___FILEBASENAME___Info*) info index:(NSInteger)index;

@end
