/* @pjs preload="idle.gif","idle_enemy.gif"*/

final int screenWidth = 960;
final int screenHeight=640;

debug=true;
void initialize() {
	addScreen("level1",new MyLevel(screenWidth,screenHeight));
}

class MyLevel extends Level{
	MyLevel(float levelWidth,float levelHeight){
		super(levelWidth, levelHeight);
		addLevelLayer("layer1",new MyLevelLayer(this));
	}
}
class MyLevelLayer extends LevelLayer{
	MyLevelLayer(Level owner){
		super(owner);
		color blueishColor=color(0,130,255);
		setBackgroundColor(blueishColor);
		thePlayer p1= new thePlayer();
		p1.setPosition(width/2,height/2);
		addPlayer(p1);
		MyEnemy msno=new MyEnemy();
		addInteractor(msno);
		addBoundary(new Boundary(0,height,width,height));
		addBoundary(new Boundary(width,height,width,0));
		addBoundary(new Boundary(width,0,0,0));
		addBoundary(new Boundary(0,0,0,height));
	}
}
class thePlayer extends Player {
	thePlayer(){
		super("thePlayer");
		setStates();
		handleKey('w');
		handleKey('a');
		handleKey('s');
		handleKey('d');
		setImpulseCoefficients(0.55,0.55);
		setScale(2);
	}
	void setStates(){
		addState(new State("idle","idle.gif"));
		addState(new State("idleTurn","idle.gif"));
		setCurrentState("idle");
	}
	void handleInput(){
		if(isKeyDown('w')) { 
			
			addImpulse(0,-1);
		}
		if(isKeyDown('a')) { 
			setHorizontalFlip(true);
			addImpulse(-1,0);
			setCurrentState("idleTurn");
		}
		if(isKeyDown('d')) { 
			setHorizontalFlip(false);
			addImpulse(1,0);
			setCurrentState("idleTurn");
		}
		if(isKeyDown('s')) { 
			addImpulse(0,1);
			setCurrentState("idle");
		}
	}
	void hit(){
		fill(255,0,0,200);
		rect(x-10,y-10,19,19);
	}
}
class MyEnemy extends Interactor implements Tracker{
	MyEnemy(){
		super("enemy");
		setStates();
		setImpulseCoefficients(0.5,0.5);
	}
	void setStates(){
		addState(new State("idle", "idle_enemy.gif"));
	}
	void track(Actor actor, float x, float y, float w, float h){
		GenericTracker.track(this,actor, 1);
	}
	void overlapOccurredWith(Actor other, float[] direction){
		other.hit();
	}
}