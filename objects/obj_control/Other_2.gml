/// @description game variables

// game variables
global.playerControl = true;

// player states
enum playerState {
	idle,
	walking,
	pickingUp,
	carrying,
	carryIdle,
	puttingDown,
}
