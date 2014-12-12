%hook ViewController

-(void)viewDidLoad {
	// load 2048's original viewDidLoad
	%orig;

	// add an auto play button to home screen
	UIButton *autoPlayButton = [[UIButton alloc] initWithFrame:CGRectMake(120, 120, 50, 50)];
	[autoPlayButton addTarget:self action:@selector(didHitBackButton:) forControlEvents:UIControlEventTouchUpInside];
	[autoPlayButton setBackgroundColor:[UIColor redColor]];
	[[self view] addSubview:autoPlayButton];
}

%new
-(void)didHitBackButton:(UIButton*)aButton {
	[self playGameRecursively];
}

%new
-(void)playGameRecursively {

	// play a very naive way, but works surprisingly well
	// object is try and keep top left corner stacked
	BOOL gameOver = NO;
	if (![self tryLeftMove])
		if (![self tryUpMove])
			if (![self tryDownMove])
				gameOver = ![self tryRightMove];

	// failed, better luck next time
	if (gameOver)
		return;

	// keep on going
	[self performSelector:@selector(playGameRecursively) withObject:nil afterDelay:0.5];
}


%new
-(BOOL)tryLeftMove {

	NSArray *gameState = [NSArray arrayWithArray:MSHookIvar<NSMutableArray*>(self, "theCubeTab")];
	[self leftSwipeHandle:nil];
	NSMutableArray *newGameState = MSHookIvar<NSMutableArray*>(self, "theCubeTab");

	return ![gameState isEqual:newGameState];
}

%new
-(BOOL)tryUpMove {
	NSArray *gameState = [NSArray arrayWithArray:MSHookIvar<NSMutableArray*>(self, "theCubeTab")];
	[self upSwipeHandle:nil];
	NSMutableArray *newGameState = MSHookIvar<NSMutableArray*>(self, "theCubeTab");

	return ![gameState isEqual:newGameState];
}

%new
-(BOOL)tryDownMove {
	NSArray *gameState = [NSArray arrayWithArray:MSHookIvar<NSMutableArray*>(self, "theCubeTab")];
	[self downSwipeHandle:nil];
	NSMutableArray *newGameState = MSHookIvar<NSMutableArray*>(self, "theCubeTab");

	return ![gameState isEqual:newGameState];
}

%new
-(BOOL)tryRightMove {
	NSArray *gameState = [NSArray arrayWithArray:MSHookIvar<NSMutableArray*>(self, "theCubeTab")];
	[self rightSwipeHandle:nil];
	NSMutableArray *newGameState = MSHookIvar<NSMutableArray*>(self, "theCubeTab");

	return ![gameState isEqual:newGameState];
}


%end

