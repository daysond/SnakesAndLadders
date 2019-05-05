//
//  PlayerManager.h
//  SnakeAndLadders
//
//  Created by Dayson Dong on 2019-05-05.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlayerManager : NSObject

@property (nonatomic) NSMutableArray <Player *> *players;
@property (nonatomic) NSUInteger currentIndex;
@property (nonatomic) BOOL shouldRestart;
@property (nonatomic) BOOL gameOn;

-(void)createPlayer;
-(void)gameOver;
-(void)startGame;

@end

NS_ASSUME_NONNULL_END
