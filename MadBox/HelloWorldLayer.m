//
//  HelloWorldLayer.m
//  MadBox
//
//  Created by Vinu Ilangovan on 2/23/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "MainGame.h"
#import "HowTo.h"
#import "Objectives.h"
#import "Stats.h"
#import "About.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

CCSprite *mainTitle;
CCSprite *mainBackground;
CCSprite *mainBackground2;

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
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
        
        mainTitle = [CCSprite spriteWithFile:@"Title3.png"];
        mainTitle.position = ccp(160, 520);
        [self addChild:mainTitle];
        
		CCMenuItemImage *playB = [CCMenuItemImage itemWithNormalImage:@"Play Button 2.png" selectedImage:@"Play Button 2 Pressed.png" target:self selector:@selector(gotoGame:)];
        //playB.position = ccp(0, -95);
        playB.position = ccp(0, -300);
        
        CCMenuItemImage *howtoB = [CCMenuItemImage itemWithNormalImage:@"How To Button.png" selectedImage:@"How To Button Pressed.png" target:self selector:@selector(gotoHowto:)];
        //howtoB.position = ccp(-80, -165);
        howtoB.position = ccp(-80, -300);
        
        CCMenuItemImage *objectivesB = [CCMenuItemImage itemWithNormalImage:@"Objectives Button.png" selectedImage:@"Objectives Button Pressed.png" target:self selector:@selector(gotoObjectives:)];
        //objectivesB.position = ccp(80, -165);
        objectivesB.position = ccp(80, -300);
        
        CCMenuItemImage *statsB = [CCMenuItemImage itemWithNormalImage:@"Stats Button.png" selectedImage:@"Stats Button Pressed.png" target:self selector:@selector(gotoStats:)];
        //statsB.position = ccp(-80, -210);
        statsB.position = ccp(-80, -300);
        
        CCMenuItemImage *aboutB = [CCMenuItemImage itemWithNormalImage:@"About Button.png" selectedImage:@"About Button Pressed.png" target:self selector:@selector(gotoAbout:)];
        //aboutB.position = ccp(80, -210);
        aboutB.position = ccp(80, -300);
        
        CCMenu *menu = [CCMenu menuWithItems:playB, howtoB, objectivesB, statsB, aboutB, nil];
        
        [self addChild:menu];
        
        double time = 1.0;
        id delay = [CCDelayTime actionWithDuration: time];
        double time2 = 0.2;
        id delay2 = [CCDelayTime actionWithDuration: time2];
        
        id moveDown = [CCMoveTo actionWithDuration:0.2 position:ccp(160, 420)];
        id jumpDown = [CCJumpBy actionWithDuration:0.2 position:ccp(0, 0) height:-25 jumps:1];
        id jumpUp = [CCJumpBy actionWithDuration:0.2 position:ccp(0, 0) height:25 jumps:1];
        id moveUpPlay = [CCMoveTo actionWithDuration:0.2 position:ccp(0, -95)];
        id moveUpHow = [CCMoveTo actionWithDuration:0.2 position:ccp(-80, -165)];
        id moveUpObjectives = [CCMoveTo actionWithDuration:0.2 position:ccp(80, -165)];
        id moveUpStats = [CCMoveTo actionWithDuration:0.2 position:ccp(-80, -210)];
        id moveUpAbout = [CCMoveTo actionWithDuration:0.2 position:ccp(80, -210)];
        
        id sequenceTitle = [CCSequence actions: delay, moveDown, jumpDown, nil];
        id sequencePlay = [CCSequence actions: delay, moveUpPlay, jumpUp, nil];
        id sequenceHow = [CCSequence actions: delay, delay2, moveUpHow, jumpUp, nil];
        id sequenceObjectives = [CCSequence actions: delay, delay2, delay2, moveUpObjectives, jumpUp, nil];
        id sequenceStats = [CCSequence actions: delay, delay2, delay2, delay2, moveUpStats, jumpUp, nil];
        id sequenceAbout = [CCSequence actions: delay, delay2, delay2, delay2, delay2, moveUpAbout, jumpUp, nil];
        
        [mainTitle runAction:sequenceTitle];
        [playB runAction:sequencePlay];
        [howtoB runAction:sequenceHow];
        [objectivesB runAction:sequenceObjectives];
        [statsB runAction:sequenceStats];
        [aboutB runAction:sequenceAbout];
        
	}
	return self;
}


-(void) onEnter
{
    // Called right after a node's init method is called.
    // If using a CCTransitionScene: called when the transition begins.
    
    [self schedule:@selector(callEveryFrame:)];
    
    [super onEnter];
}


-(void) callEveryFrame:(ccTime)dt{
    mainBackground.position = ccp(160, mainBackground.position.y - 50*dt);
    mainBackground2.position = ccp(160, mainBackground2.position.y - 50*dt);
    if (mainBackground.position.y < -1440) {
        mainBackground.position = ccp(mainBackground.position.x, mainBackground.position.y + 5760);
    }
    if (mainBackground2.position.y < -1440) {
        mainBackground2.position = ccp(mainBackground2.position.x, mainBackground2.position.y + 5760);
    }
}

-(void)gotoGame:(id)sender{
    [[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[MainGame node] withColor:ccWHITE]];
}

-(void)gotoHowto:(id)sender{
    [[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[HowTo node] withColor:ccWHITE]];
}

-(void)gotoObjectives:(id)sender{
    [[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[Objectives node] withColor:ccWHITE]];
}

-(void)gotoStats:(id)sender{
    [[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[Stats node] withColor:ccWHITE]];
}

-(void)gotoAbout:(id)sender{
    [[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:0.5 scene:[About node] withColor:ccWHITE]];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
