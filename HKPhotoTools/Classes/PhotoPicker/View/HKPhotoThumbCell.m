//
//  HKPhotoThumbCell.m
//  FBSnapshotTestCase
//
//  Created by HK on 2020/4/26.
//

#import "HKPhotoThumbCell.h"

@interface HKPhotoThumbCell ()

@property (strong, nonatomic, readonly) UIView *coverView;

@end


@implementation HKPhotoThumbCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor yellowColor];
    }
    return self;
}



@end
