//
//  HKViewController.m
//  HKPhotoTools
//
//  Created by 1005753869@qq.com on 04/26/2020.
//  Copyright (c) 2020 1005753869@qq.com. All rights reserved.
//

#import "HKViewController.h"
#import <HKPhotoPickerView.h>
#import <Masonry/Masonry.h>

@interface HKViewController ()

@property (strong, nonatomic) HKPhotoPickerView *pickerView;


@end

@implementation HKViewController

//- (instancetype)initWithCoder:(NSCoder *)coder
//{
//    self = [super initWithCoder:coder];
//    if (self) {
//    }
//    return self;
//}



- (void)loadingViews
{
    [self.view addSubview:self.pickerView];
}

- (void)updateViewConstraints
{
    
    NSLog(@"HKViewController Update View Contstraints");
    
    [self.pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(74, 10, 10, 10));
    }];
    
    [super updateViewConstraints];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(NSStringFromSelector(_cmd));
    
    [self loadingViews];
    

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(NSStringFromSelector(_cmd));
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(NSStringFromSelector(_cmd));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (HKPhotoPickerView *)pickerView
{
    if (!_pickerView) {
        HKPhotoPickerViewModel *viewModel = [[HKPhotoPickerViewModel alloc] init];
        _pickerView = [[HKPhotoPickerView alloc] initWithViewModel:viewModel];
    }
    return _pickerView;
}


@end
