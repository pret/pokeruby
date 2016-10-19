#ifndef GUARD_SOUND_H
#define GUARD_SOUND_H

void InitMapMusic(void);
void MapMusicMain(void);
void ResetMapMusic(void);
u16 GetCurrentMapMusic(void);
void PlayNewMapMusic(u16 songNum);
void StopMapMusic(void);
void FadeOutMapMusic(u8 speed);
void FadeOutAndPlayNewMapMusic(u16 songNum, u8 speed);
void FadeOutAndFadeInNewMapMusic(u16 songNum, u8 fadeOutSpeed, u8 fadeInSpeed);
void FadeInNewMapMusic(u16 songNum, u8 speed);
bool8 IsNotWaitingForBkgndMusicStop(void);
void PlayFanfareByFanfareNum(u8 fanfareNum);
bool8 WaitFanfare(bool8 stop);
void StopFanfareByFanfareNum(u8 fanfareNum);
void PlayFanfare(u16 songNum);
bool8 IsFanfareTaskInactive(void);
void FadeInNewBkgndMusic(u16 songNum, u8 speed);
void FadeOutBkgndMusicTemporarily(u8 speed);
bool8 IsBkgndMusicPausedOrStopped(void);
void FadeInBkgndMusic(u8 speed);
void FadeOutBkgndMusic(u8 speed);
bool8 IsBkgndMusicStopped(void);
void PlayCry1(u16 species, s8 pan);
void PlayCry2(u16 species, s8 pan, s8 volume, u8 priority);
void PlayCry3(u16 species, s8 pan, u8 mode);
void PlayCry4(u16 species, s8 pan, u8 mode);
void PlayCry5(u16 species, u8 mode);
bool8 IsCryFinished(void);
void StopCryAndClearCrySongs(void);
void StopCry(void);
bool8 IsCryPlayingOrClearCrySongs(void);
bool8 IsCryPlaying(void);
void PlayBkgndMusic(u16 songNum);
void PlaySoundEffect(u16 songNum);
void PlaySoundEffect12WithPanning(u16 songNum, u8 pan);
void PlaySoundEffect1WithPanning(u16 songNum, u8 pan);
void PlaySoundEffect2WithPanning(u16 songNum, u8 pan);
void SoundEffect12PanpotControl(u8 pan);
bool8 IsSoundEffectPlaying(void);
bool8 IsBkgndMusicPlaying(void);
bool8 IsSpecialSoundEffectPlaying(void);

#endif // GUARD_SOUND_H
