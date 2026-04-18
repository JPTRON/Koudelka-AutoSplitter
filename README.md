## AutoSplitter for the game Koudelka
_Koudelka is a RPG developed by Sacnoth for the PS1, published by SNK in Japan in 1999._

**Disclaimer: This AutoSplitter is currently only functional for Any% runs.**

It splits on every boss fight once the boss's HP reaches 0, besides on the last fight where it splits once all characters die.
It also keeps track of the amount of steps until the next random fight is triggered.

This repository also features a default LiveSplit splits and layout with every compatible split and an ASL Var Viewer for the step counter.

Dependencies: 
- [emu-help](https://github.com/Jujstme/emu-help-v3)
  - place [this file](https://github.com/Jujstme/emu-help-v3/blob/main/lib%2FLivesplit%2Femu-help-v3) inside the folder "_LiveSplit/Components_"
- [ASL Var Viewer](https://github.com/hawkerm/LiveSplit.ASLVarViewer)
  - place the content of [this .zip](https://github.com/hawkerm/LiveSplit.ASLVarViewer/releases/tag/1.1) inside the folder "_LiveSplit/Components_"
