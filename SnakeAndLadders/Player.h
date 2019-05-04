//
//  Player.h
//  SnakeAndLadders
//
//  Created by Dayson Dong on 2019-05-04.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Player : NSObject

@property (nonatomic, assign) NSUInteger currentSquare;
@property (nonatomic) BOOL gameOver;

-(void)roll;
-(void)updateSquare;

@end

NS_ASSUME_NONNULL_END
