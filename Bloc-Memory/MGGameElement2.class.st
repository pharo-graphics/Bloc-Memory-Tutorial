Class {
	#name : #MGGameElement2,
	#superclass : #BlElement,
	#instVars : [
		'game'
	],
	#category : #'Bloc-Memory-Elements2'
}

{ #category : #example }
MGGameElement2 class >> example [
	<sampleInstance>
	
	^ self new memoryGame: MGGame withNumbers; yourself

]

{ #category : #example }
MGGameElement2 class >> exampleInASpace [
	<sampleInstance>
	
	self openOnModel: MGGame withNumbers inSpace: (BlSpace new extent: 420@420; yourself)

]

{ #category : #example }
MGGameElement2 class >> exampleInASpaceInAnOSWindow [
	<sampleInstance>
	
	self nativelyOpenOnModel: MGGame withNumbers inSpace: BlSpace new.
]

{ #category : #opening }
MGGameElement2 class >> nativelyOpenOnModel: aModel inSpace: aSpace [

	aSpace host: BlOSWindowSDL2Host new.
	^ self openOnModel: aModel inSpace: aSpace.
]

{ #category : #'instance creation' }
MGGameElement2 class >> onModel: aModel [
	"(self onModel: MGGame withEmoji) openInNewSpace"
	"(self onModel: MGGame withEmoji) openInNewSpace"
	
	^ self new memoryGame: aModel; yourself
]

{ #category : #'instance creation' }
MGGameElement2 class >> onModel: aModel inSpace: aSpace [

	| game |
	game := self onModel: aModel.
	aSpace root addChild: game. 
	^ game
]

{ #category : #opening }
MGGameElement2 class >> openOnModel: aModel inSpace: aSpace [

	| game |
	game := self onModel: aModel inSpace: aSpace.
	aSpace pulse.
	aSpace show.
	^ game
]

{ #category : #example }
MGGameElement2 class >> openWithNumber [
	<script>
	| aGameElement space |
	aGameElement := MGGameElement2 new
		                memoryGame: MGGame withNumbers;
		                yourself.
	space := BlSpace new.
	space root addChild: aGameElement.
	space root whenLayoutedDoOnce: [ space extent: 420 @ 420 ].
	space show
]

{ #category : #example }
MGGameElement2 class >> openWithNumberNoHost [

	<script>
	| aGameElement space |
	aGameElement := MGGameElement2 new
		                memoryGame: MGGame withNumbers;
		                yourself.
	space := BlSpace new.
	space root addChild: aGameElement.
	space root whenLayoutedDoOnce: [ space extent: 420 @ 420 ].
	space show
]

{ #category : #initialization }
MGGameElement2 >> initialize [

	super initialize.
	self background: Color veryLightGray.

	self layout: (BlGridLayout horizontal cellSpacing: 20).

	self constraintsDo: [ :layoutConstraints | 
		layoutConstraints horizontal fitContent.
		layoutConstraints vertical fitContent ]
]

{ #category : #accessing }
MGGameElement2 >> memoryGame [

	^ game
]

{ #category : #accessing }
MGGameElement2 >> memoryGame: aGame [

	| aCardEventListener |
	game := aGame.
	aCardEventListener :=
		MGCardEventListener new
			memoryGame: aGame;
			yourself.

	self layout columnCount: game gridSize.

	game availableCards do: [ :aCard | 
		| cardElement |
		cardElement :=
			MGCardElement2 new
				card: aCard;
				addEventHandler: aCardEventListener;
				yourself.
		self addChild: cardElement ]
]
