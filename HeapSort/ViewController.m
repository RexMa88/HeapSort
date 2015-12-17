//
//  ViewController.m
//  HeapSort
//
//  Created by Rex Ma on 15/12/17.
//  Copyright © 2015年 Rex Ma. All rights reserved.
//

#import "ViewController.h"

#define leftChild(i)    (2*i+1)

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray * sortArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.sortArray = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        [self.sortArray addObject:[NSNumber numberWithInteger:(arc4random() % 100)+1]];
    }
    [self HeapSortArray:self.sortArray count:self.sortArray.count];
}

- (void)percDownArray:(NSMutableArray *)array index:(NSUInteger)index count:(NSUInteger)count{
    
    NSUInteger child;
    NSUInteger Tmp;
    
    for (Tmp = [array[index] integerValue]; leftChild(index) < count; index=child) {
        child = leftChild(index);
        
        if (child != count - 1 && array[child + 1] > array[child])
            child++;
        if (Tmp < [array[child] integerValue])
            array[index] = array[child];
        else break;
    }
    array[index] = [NSNumber numberWithInteger:Tmp];//此时index = child，所以把临时值赋给孩子节点;
}

- (void)HeapSortArray:(NSMutableArray *)array count:(NSUInteger)count{
    NSUInteger index;
    
    for (index = count / 2; index > 0; index--)
        [self percDownArray:array index:index count:count];
    for (index = count - 1; index > 0; index--) {
        array = [self swapArray:array indexOne:0 indexTwo:index];
        [self percDownArray:array index:0 count:index];
    }
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"The num is %d",[obj integerValue]);
    }];
}

- (NSMutableArray *)swapArray:(NSMutableArray *)array indexOne:(NSUInteger)indexOne indexTwo:(NSUInteger)indexTwo{
    NSUInteger temp = [array[indexOne] integerValue];
    array[indexOne] = array[indexTwo];
    array[indexTwo] = [NSNumber numberWithInteger:temp];
    return array;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
