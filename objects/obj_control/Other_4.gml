/// @description Deal with music and more

// Play music based on room
switch room {
	case rm_gameMain: {
		audio_play_sound(snd_townBGM,1,true);
		audio_play_sound(snd_townAmbience,1,true);
	}; break;
};

