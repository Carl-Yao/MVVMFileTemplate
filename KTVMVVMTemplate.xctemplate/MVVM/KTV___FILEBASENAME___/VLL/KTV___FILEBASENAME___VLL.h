//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import <Foundation/Foundation.h>
#import "KTV___FILEBASENAME___View.h"
#import "KTV___FILEBASENAME___VM.h"

@protocol KTV___FILEBASENAME___VLLDelegate;

@interface KTV___FILEBASENAME___VLL: NSObject<KTV___FILEBASENAME___ViewDataSource,KTV___FILEBASENAME___ViewEventDelegate>
@property (nonatomic, strong) KTV___FILEBASENAME___VM * viewModel;
@property (nonatomic, weak) id<KTV___FILEBASENAME___VLLDelegate> delegate;

@end

@protocol KTV___FILEBASENAME___VLLDelegate <NSObject>
@optional
//to do
@end