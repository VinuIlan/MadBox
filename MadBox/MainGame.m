//
//  MainGame.m
//  MadBox
//
//  Created by Vinu Ilangovan on 2/23/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "MainGame.h"
#import "EndGame.h"
#import "HelloWorldLayer.h"

#import "CCTouchDispatcher.h"

CCSprite *mainBackground;
CCSprite *mainBackground2;
CCSprite *battlefield;
CCSprite *pauseScreenBack;
CCSprite *topBar;

CCSprite *guyOne;
CCSprite *guyOne2;
CCSprite *guyOne3;
CCSprite *guyTwo;

CCMenuItemImage *resumeB;
CCMenuItemImage *quitB;
CCMenuItemImage *pauseB;

double speed = 1.0;
double savedSpeed = 0.0;
int randomNumber = 2;
BOOL pauseOn;
int currentScore;

NSString *scoreString;
CCLabelTTF *scoreLabel;


@implementation MainGame

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainGame *layer = [MainGame node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        mainBackground = [CCSprite spriteWithFile:@"MovingBackground.png"];
        mainBackground.position = ccp(160, 1440);
        [self addChild:mainBackground];
        
        mainBackground2 = [CCSprite spriteWithFile:@"MovingBackground.png"];
        mainBackground2.position = ccp(160, 4320);
        [self addChild:mainBackground2];
        
        battlefield = [CCSprite spriteWithFile:@"BattleField4.png"];
        battlefield.position = ccp(160, 196);
        [self addChild:battlefield];
        
		
		guyOne = [CCSprite spriteWithFile:@"Enemy.png"];
        guyOne.position = ccp(61, 600);
        [self addChild:guyOne];
        
        guyOne2 = [CCSprite spriteWithFile:@"Enemy.png"];
        guyOne2.position = ccp(127, 600);
        [self addChild:guyOne2];
        
        guyOne3 = [CCSprite spriteWithFile:@"Enemy.png"];
        guyOne3.position = ccp(259, 600);
        [self addChild:guyOne3];
        
        guyTwo = [CCSprite spriteWithFile:@"Boxxy.png"];
        guyTwo.position = ccp(193, 35);
        [self addChild:guyTwo];
        
        pauseScreenBack = [CCSprite spriteWithFile:@"PauseScreen2.png"];
        //pauseScreenBack.position = ccp(160, 196);
        pauseScreenBack.position = ccp(160, 240);
        pauseScreenBack.visible = NO;
        [self addChild:pauseScreenBack];
        
        topBar = [CCSprite spriteWithFile:@"TopBar.png"];
        topBar.position = ccp(160, 458);
        [self addChild:topBar];
        
        scoreString = [[NSString alloc]initWithFormat:@"%i", currentScore];
        scoreLabel=[CCLabelTTF labelWithString:scoreString fontName:@"marker felt" fontSize:25];
        scoreLabel.position=ccp(30,460);
        [scoreLabel setString:scoreString];
        [self addChild:scoreLabel];
        
        resumeB = [CCMenuItemImage itemWithNormalImage:@"Resume Button.png" selectedImage:@"Resume Button Pressed.png" target:self selector:@selector(gotoResume:)];
        resumeB.position = ccp(0, -100);
        resumeB.visible = NO;
        
        quitB = [CCMenuItemImage itemWithNormalImage:@"Quit Button.png" selectedImage:@"Quit Button Pressed.png" target:self selector:@selector(gotoQuit:)];
        quitB.position = ccp(0, -145);
        quitB.visible = NO;
        
        pauseB = [CCMenuItemImage itemWithNormalImage:@"PauseButton.png" selectedImage:@"PauseButton.png" target:self selector:@selector(gotoPause:)];
        pauseB.position = ccp(140, 220);
        
        CCMenu *menu = [CCMenu menuWithItems:pauseB, resumeB, quitB, nil];
        
        [self addChild:menu];
        
        
	}
	return self;
}


-(void) onEnter
{
    // Called right after a node's init method is called.
    // If using a CCTransitionScene: called when the transition begins.
    
    speed = 1.0;
    savedSpeed = 0.0;
    randomNumber = 2;
    pauseOn = NO;
    currentScore = 0;
    
    self.isTouchEnabled = YES;
    
    [self schedule:@selector(callEveryFrame:)];
    
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    
    [super onEnter];
}


-(void) callEveryFrame:(ccTime)dt{
    
    currentScore++;
    scoreString = [[NSString alloc]initWithFormat:@"%i", currentScore];
    
    if (currentScore > 99) {
        scoreLabel.position=ccp(37.5,460);
    }
    else if (currentScore > 999) {
        scoreLabel.position=ccp(45,460);
    }
    
    [scoreLabel setString:scoreString];
    
    mainBackground.position = ccp(160, mainBackground.position.y - 50*dt);
    mainBackground2.position = ccp(160, mainBackground2.position.y - 50*dt);
    if (mainBackground.position.y < -1440) {
        mainBackground.position = ccp(mainBackground.position.x, mainBackground.position.y + 5760);
    }
    if (mainBackground2.position.y < -1440) {
        mainBackground2.position = ccp(mainBackground2.position.x, mainBackground2.position.y + 5760);
    }
    
    if (randomNumber == 1) {
        guyOne.position = ccp(127, guyOne.position.y - speed*100*dt);
        guyOne2.position = ccp(193, guyOne2.position.y - speed*100*dt);
        guyOne3.position = ccp(259, guyOne3.position.y - speed*100*dt);
    }
    else if (randomNumber == 2){
        guyOne.position = ccp(61, guyOne.position.y - speed*100*dt);
        guyOne2.position = ccp(193, guyOne2.position.y - speed*100*dt);
        guyOne3.position = ccp(259, guyOne3.position.y - speed*100*dt);
    }
    else if (randomNumber ==3){
        guyOne.position = ccp(61, guyOne.position.y - speed*100*dt);
        guyOne2.position = ccp(127, guyOne2.position.y - speed*100*dt);
        guyOne3.position = ccp(259, guyOne3.position.y - speed*100*dt);
    }
    else if (randomNumber == 4){
        guyOne.position = ccp(61, guyOne.position.y - speed*100*dt);
        guyOne2.position = ccp(127, guyOne2.position.y - speed*100*dt);
        guyOne3.position = ccp(193, guyOne3.position.y - speed*100*dt);
    }
    
    if (guyOne.position.y < 0 - 50) {
        randomNumber = (arc4random() % 4) + 1;
        guyOne.position = ccp(guyOne.position.x, 480 + 50);
        guyOne2.position = ccp(guyOne2.position.x, 480 + 50);
        guyOne3.position = ccp(guyOne3.position.x, 480 + 50);
        speed = speed + 0.1;
    }
    
    //Collision Detection
    if ((guyOne.position.y - 30) <= (65) && (guyOne.position.y + 30) >= (5)) {
        if (guyTwo.position.x == guyOne.position.x) {
            speed = 0;
            [[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[EndGame node] withColor:ccWHITE]];
        }
        else if (guyTwo.position.x == guyOne2.position.x) {
            speed = 0;
        }
        else if (guyTwo.position.x == guyOne3.position.x) {
            speed = 0;
        }
    }
}



-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    return YES;
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint location = [touch locationInView:[touch view]];
    CGPoint convertedLocation = [[CCDirector sharedDirector]convertToGL:location];
    
    if (pauseOn == NO) {
        if (convertedLocation.x < 97) {
            guyTwo.position = ccp(61, 35);
        }
        else if (convertedLocation.x >= 97 && convertedLocation.x < 163){
            guyTwo.position = ccp(127, 35);
        }
        else if (convertedLocation.x >= 162 && convertedLocation.x < 229){
            guyTwo.position = ccp(193, 35);
        }
        else if (convertedLocation.x >= 229 && convertedLocation.x < 350){
            guyTwo.position = ccp(259, 35);
        }
    }
    //guyTwo.position = ccp(convertedLocation.x, 100);
}

-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}


-(void)gotoPause:(id)sender{
    savedSpeed = speed;
    speed = 0;
    pauseOn = YES;
    pauseScreenBack.visible = YES;
    resumeB.visible = YES;
    quitB.visible = YES;
    pauseB.visible = NO;
}

-(void)gotoResume:(id)sender{
    speed = savedSpeed;
    pauseOn = NO;
    pauseScreenBack.visible = NO;
    resumeB.visible = NO;
    quitB.visible = NO;
    pauseB.visible = YES;
}

-(void)gotoQuit:(id)sender{
    [[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[HelloWorldLayer node] withColor:ccWHITE]];
}


@end
