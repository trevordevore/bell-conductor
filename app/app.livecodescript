script "app"
command PreloadApplication
  if the environment is "development" then
    levureLoadExternalEditorServer
  end if
end PreloadApplication


command InitializeApplication
  storeSet "notes", appGetPref("notes")
  storeSet "tempo", appGetPref("tempo")
  storeSet "note speed", appGetPref("note speed")
end InitializeApplication


command OpenApplication
  go stack "Configuration"
end OpenApplication


command PreShutdownApplication

end PreShutdownApplication
