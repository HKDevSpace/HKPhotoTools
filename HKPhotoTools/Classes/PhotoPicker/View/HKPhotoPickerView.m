//
//  HKPhotoPickerView.m
//  Pods
//
//  Created by HK on 2020/4/26.
//

#import "HKPhotoPickerView.h"
#import <Masonry/Masonry.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "HKPhotoThumbCell.h"
#import "HKPhotoPicker.h"

static NSString *const kPhotoThumbCellReuseIdentifier = @"kPhotoThumbCellReuseIdentifier";


@interface HKPhotoPickerView ()  <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;

@property (nonatomic) BOOL didMakeConstraints;

@end


@implementation HKPhotoPickerView

#pragma mark - Constructor And Destructor
- (instancetype)initWithFrame:(CGRect)frame viewModel:(HKPhotoPickerViewModel *)viewModel
{
    self = [super initWithFrame:frame];
    if (self) {
        _viewModel = viewModel;
        
        [self registerCellForCollectionView];
        [self setupViews];
        
        [[HKPhotoPicker photoPicker] fetchAssets];
    }
    
    return self;
}

- (instancetype)initWithViewModel:(HKPhotoPickerViewModel *)viewModel
{
    return [self initWithFrame:CGRectZero viewModel:viewModel];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame viewModel:[HKPhotoPickerViewModel defaultViewModel]];
}


#pragma mark - Override
- (void)updateConstraints
{
    NSLog(@"Picker View %@", NSStringFromSelector(_cmd));
    
    // 固定约束
    if (!self.didMakeConstraints) {
        NSLog(@"HKPhotoPickerView  update constraints");
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        self.didMakeConstraints = YES;
    }
    

    [super updateConstraints];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSLog(@"Picker View %@", NSStringFromSelector(_cmd));
    
}

#pragma mark - Public

#pragma mark - Actions

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.viewModel numberOfItemsAtSection:section];
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    HKPhotoInfo *info = [self.viewModel itemAtIndexPath:indexPath];
    HKPhotoThumbCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kPhotoThumbCellReuseIdentifier forIndexPath:indexPath];

    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>

#pragma mark - <UICollectionViewDelegateFlowLayout>
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//
//}
//
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section;
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;



#pragma mark - Private
- (void)setupViews
{
    [self addSubview:self.collectionView];
}

- (void)setupBinding
{
    
}

- (void)registerCellForCollectionView
{
    [self.collectionView registerClass:[HKPhotoThumbCell class] forCellWithReuseIdentifier:kPhotoThumbCellReuseIdentifier];
}


#pragma mark - Setter

#pragma mark - Getter
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;;
}





@end
