Class {
	#name : #PanelContenido,
	#superclass : #Morph,
	#instVars : [
		'conteiner',
		'table'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #'as yet unclassified' }
PanelContenido class >> call [ 
|temp|
temp :=self new.
temp extent:(500@600).
temp initialize.
^temp.
]

{ #category : #'as yet unclassified' }
PanelContenido class >> call:aTable [
|temp|
temp :=self new.
temp initialize:aTable.
^temp menuScroll.
]

{ #category : #initialization }
PanelContenido >> initialize [
| scrollPane pasteUpMorph |
	scrollPane := ScrollPane new.
	pasteUpMorph := PasteUpMorph new.
	pasteUpMorph extent: 500@1000.
	scrollPane scroller addMorph:pasteUpMorph.
	scrollPane extent:(400@200).
	self addMorph: scrollPane.




]

{ #category : #initialization }
PanelContenido >> initialize:aTable [
super initialize.
table :=aTable.
self defineMorph.
self addElements.
]

{ #category : #initialization }
PanelContenido >> menuScroll [
^conteiner.
]
