script "app"
command PreloadApplication
  if the environment is "development" then
    levureLoadExternalEditorServer
  end if
end PreloadApplication


command InitializeApplication
  storeSet "notes", prefsGetPref("notes")
  storeSet "tempo", prefsGetPref("tempo")
  storeSet "note speed", prefsGetPref("note speed")
end InitializeApplication


command OpenApplication
  go stack "Configuration"
end OpenApplication


command PreShutdownApplication

end PreShutdownApplication
