Class {
	#name : #BaselineOfBlocMemoryTutorial,
	#superclass : #BaselineOf,
	#category : #BaselineOfBlocMemoryTutorial
}

{ #category : #baselines }
BaselineOfBlocMemoryTutorial >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			baseline: 'Bloc'
			with: [
			spec repository: 'github://pharo-graphics/Bloc:master/src' ].
		spec
			package: #'Bloc-Memory' with: [ spec requires: #( #Bloc ) ];
			package: #'Bloc-Memory-Tests'
			with: [ spec requires: #( #'Bloc-Memory' ) ] ]
]
