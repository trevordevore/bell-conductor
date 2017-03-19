script "Configuration Card Behavior"
on preOpenCard
  if the environment is "mobile" then
    mobileSetAllowedOrientations "landscape right"
  end if
  put the rect of this stack into theRect
  put item 1 of theRect + 480 into item 3 of theRect
  put item 2 of theRect + 320 into item 4 of theRect
  set the rect of this stack to theRect

  set the text of field "NoteSpeed" to appGetPref("note speed")
  set the text of field "StartDelay" to appGetPref("start delay")
  set the text of field "NoteList" to appGetPref("notes")
  set the text of field "Tempo" to appGetPref("tempo")
  storeSet "notes", appGetPref("notes")
  storeSet "tempo", appGetPref("tempo")

  focus on nothing
end preOpenCard


on closeField
  switch the short name of the target
    case "NoteSpeed"
      appSetPref "note speed", word 1 to -1 of line 1 of the text of the target
      storeSet "note speed", appGetPref("note speed")
      break
    case "StartDelay"
      appSetPref "start delay", word 1 to -1 of line 1 of the text of the target
      storeSet "start delay", appGetPref("start delay")
      break
    default
      pass closeField
  end switch
end closeField


command uiLoadSong
  answer file "Select song file"
  if it is empty then return empty

   # Line 1: Target temp x,y
   # Line 2: Default tempo
   # Line 3-n: Notes note,count

   put URL("file:" & it) into theSongData
   LoadSongData theSongData
 end uiLoadSong


 command LoadSongData pSongData
  set the text of field "LblTargetTempo" to "Target Tempo:" && line 1 of pSongData
  set the text of field "NoteList" to line 3 to -1 of pSongData

  set the itemDelimiter to "-"
  set the text of field "Tempo" to word 1 to -1 of line 2 of pSongData

  appSetPref "notes", the text of field "NoteList"
  appSetPref "tempo", the text of field "Tempo"
  storeSet "notes", appGetPref("notes")
  storeSet "tempo", appGetPref("tempo")
 end LoadSongData


 command uiPlaySong
  go stack "Playback" in window (the short name of this stack)
 end uiPlaySong


 command uiToggleFullscreen
  if the fullscreen of this stack then
    set the fullscreen of this stack to false
  else
    set the fullscreen of this stack to true
  end if
end uiToggleFullscreen
