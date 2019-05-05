//
//  PlayerManager.m
//  SnakeAndLadders
//
//  Created by Dayson Dong on 2019-05-05.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "PlayerManager.h"
#import "InputHandler.h"


@implementation PlayerManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _players = [[NSMutableArray alloc]init];
        _currentIndex = 0;
        _shouldRestart = YES;
    }
    return self;
}

#pragma mark - private

-(NSInteger)parseInput {
    while (YES) {
        NSString* input = [[InputHandler new] output:@"Please enter the number of players: "];
        if ([input intValue]) {
            return [input intValue];
        }
        NSLog(@"Please enter a valid number!");
    }
    
}

#pragma mark - public

- (void)roll {
    if (self.currentIndex == self.players.count) {
        self.currentIndex = 0;
    }
    [self.players[self.currentIndex] roll];    
}

- (void)output {
    [self.players[self.currentIndex] updateSquare];
    self.shouldRestart = [self.players[self.currentIndex] gameOver];
    self.currentIndex ++;
}

- (void)createPlayer {
    if ([self.players count] == 0) {
        NSInteger numberOfPlayers = [self parseInput];
        for (int i = 0; i < numberOfPlayers; i++) {
            Player *player = [[Player alloc]init];
            NSString *name = [[InputHandler new] output:[NSString  stringWithFormat: @"Enter player%d name: ",i+1]];
            [player setName:name];
            [self.players addObject:player];
        }
    }
}

-(void)gameOver{
    [self.players removeAllObjects];
    self.currentIndex = 0;
    self.shouldRestart = NO;
}

- (NSString *)score {
    NSMutableString *score = [NSMutableString stringWithFormat:@"Score: "];
    for (int i = 0; i < [self.players count]; i++) {
        [score appendFormat:@"%@: %ld ",[self.players[i].name capitalizedString], self.players[i].currentSquare];
    }
    return [NSString stringWithString:score];
}


@end
