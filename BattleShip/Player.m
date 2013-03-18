//
//  Player.m
//  BattleShip
//
//  Created by Student on 3/13/13.
//
//

#import "Player.h"
#import "Globals.h"


@implementation Player
@synthesize selectedShip;

-(id)PlayerInitWithName:(NSString *)playerName
{
    if( (self=[super init]))
    {        
        [self setName:playerName];
        score = 0;
        numCorr = 0;
        numIncorr = 0;
        self.selectedShip = [[ship alloc] init];
        NSArray *images = [NSArray arrayWithObjects:@"bship4.jpg", @"bship4.jpg", @"bship4.jpg", nil];
        int counter = 0;
        for (NSString *image in images){
            ship *ship = [[[ship alloc] initWithFile:image] autorelease];
            float x = ship.sprite.boundingBox.size.width / 2;
            float y = TILESIZE * counter + (ship.sprite.boundingBox.size.height / 2);
            CGPoint useTwice = ccp((int)x, (int)y);
            ship.sprite.position = useTwice;
            ship.startingPosition = useTwice;
            ship.shipIdentifier = counter + 1;
            [allShips addObject:ship];
            //[ship release];
            counter++;
        }
    }
    
    return self;
}

-(id)PlayerInit
{
    if( (self=[super init]))
    {
        score = 0;
        numCorr = 0;
        numIncorr = 0;
    }
    return self;
}
//set the name of the player
-(void)setName:(NSString *)playerName
{
    name = playerName;
}
//sets the score of the game
-(void)setScore:(NSInteger *)playerScore
{
    score = playerScore;
}
//set the number that are correct
-(void)setNumCorr:(NSInteger *)playerNumCorr
{
    numCorr = playerNumCorr;
}
//set the number incorrect
-(void)setNumIncorr:(NSInteger *)playerNumIncorr
{
    numIncorr = playerNumIncorr;
}
//get the name of the player
-(NSString*)getName
{
    return name;
}
//gets score of the game
-(NSInteger*)getScore
{
    return score;
}
//get the number correct
-(NSInteger*)getNumCorr
{
    return numCorr;
}
//get the number incorrect
-(NSInteger*)getNumIncorr
{
    return numIncorr;
}
//reset all of the attributes of Player
-(void)resetAll;
{
    [allShips removeAllObjects];
    name = NULL;
    score = 0;
    numCorr = 0;
    numIncorr = 0;
}
-(void)resetScore;
{
    score = 0;
}
-(void)resetNumCorr;
{
    numCorr = 0;
    numIncorr = 0;

}
-(void)resetAllButName;
{
    score = 0;
    numCorr = 0;
    numIncorr = 0;

}

@end
