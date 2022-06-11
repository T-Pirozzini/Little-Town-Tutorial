/// @description variables and setup

// text box variables
textToShow = "text example! With even more text to show wrap!";
textWidth = 450;
lineHeight = 38;
fadeMe = 0;
fadeSpeed = 0.1;
image_alpha = 0;

global.playerControl = false;

// play UI sound
audio_play_sound(snd_pop01,1,false);

// dismiss any visible prompts 
scr_dismissPrompt(obj_prompt,0);