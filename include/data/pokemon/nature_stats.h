//

//

#ifndef POKERUBY_NATURE_STATS_H
#define POKERUBY_NATURE_STATS_H

const s8 gNatureStatTable[][5] = {
    // Atk Def Spd Sp.Atk Sp.Def
    {    0,  0,  0,     0,     0}, // Hardy
    {    1, -1,  0,     0,     0}, // Lonely
    {    1,  0, -1,     0,     0}, // Brave
    {    1,  0,  0,    -1,     0}, // Adamant
    {    1,  0,  0,     0,    -1}, // Naughty
    {   -1,  1,  0,     0,     0}, // Bold
    {    0,  0,  0,     0,     0}, // Docile
    {    0,  1, -1,     0,     0}, // Relaxed
    {    0,  1,  0,    -1,     0}, // Impish
    {    0,  1,  0,     0,    -1}, // Lax
    {   -1,  0,  1,     0,     0}, // Timid
    {    0, -1,  1,     0,     0}, // Hasty
    {    0,  0,  0,     0,     0}, // Serious
    {    0,  0,  1,    -1,     0}, // Jolly
    {    0,  0,  1,     0,    -1}, // Naive
    {   -1,  0,  0,     1,     0}, // Modest
    {    0, -1,  0,     1,     0}, // Mild
    {    0,  0, -1,     1,     0}, // Quiet
    {    0,  0,  0,     0,     0}, // Bashful
    {    0,  0,  0,     1,    -1}, // Rash
    {   -1,  0,  0,     0,     1}, // Calm
    {    0, -1,  0,     0,     1}, // Gentle
    {    0,  0, -1,     0,     1}, // Sassy
    {    0,  0,  0,    -1,     1}, // Careful
    {    0,  0,  0,     0,     0} // Quirky
};

#endif //POKERUBY_NATURE_STATS_H
