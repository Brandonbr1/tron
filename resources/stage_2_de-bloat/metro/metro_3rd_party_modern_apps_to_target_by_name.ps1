<#
Purpose:       Script to remove many of the pre-loaded 3rd-party Metro "modern app" bloatware. Called by Tron in Stage 2: De-bloat
               Add any AppX uninstall commands to this list to target them for removal
Requirements:  1. Administrator access
               2. Windows 8 and up
Author:        vocatus on reddit.com/r/TronScript ( vocatus.gate at gmail ) // PGP key: 0x07d1490f82a211a2
Version:       1.6.1 + Add additional user-submitted entries
#>
$ErrorActionPreference = "SilentlyContinue"


########
# PREP #
########
$METRO_3RD_PARTY_MODERN_APPS_TO_TARGET_BY_NAME_SCRIPT_VERSION = "1.6.1"
$METRO_3RD_PARTY_MODERN_APPS_TO_TARGET_BY_NAME_SCRIPT_DATE = "2021-03-04"

# Needed for Removal
$AppxPackages = Get-AppxProvisionedPackage -online | select-object PackageName,Displayname
$ProPackageList = Get-AppxPackage -AllUsers | select-object PackageFullName, Name
$Script:AppxCount3rd = 0

# App Removal function
Function Remove-App([String]$AppName){
	If($AppxPackages.DisplayName -match $AppName -or $ProPackageList.Name -match $AppName ) {
		$PackageFullName = ($ProPackageList | where {$_.Name -like $AppName}).PackageFullName
		$ProPackageFullName = ($AppxPackages | where {$_.Displayname -like $AppName}).PackageName

		If($PackageFullName -is [array]){
			For($i=0 ;$i -lt $PackageFullName.Length ;$i++) {
				$Script:AppxCount3rd++
				$Job = "TronScript3rd$AppxCount3rd"
				$PackageF = $PackageFullName[$i]
				$ProPackage = $ProPackageFullName[$i]
				write-output "$AppxCount3rd - $PackageF"
				Start-Job -Name $Job -ScriptBlock {
					Remove-AppxPackage -Package $using:PackageF | Out-null
					Remove-AppxProvisionedPackage -Online -PackageName $using:ProPackage | Out-null
				} | Out-null
			}
		} Else {
			$Script:AppxCount3rd++
			$Job = "TronScript3rd$AppxCount3rd"
			write-output "$AppxCount3rd - $PackageFullName"
			Start-Job -Name $Job -ScriptBlock {
				Remove-AppxPackage -Package $using:PackageFullName | Out-null
				Remove-AppxProvisionedPackage -Online -PackageName $using:ProPackageFullName | Out-null
			} | Out-null
		}
	}
}


###########
# EXECUTE #
###########
# Active identifiers
Remove-App "*DragonManiaLegends"
Remove-App "*HiddenCityMysteryofShadows"
Remove-App "*MarchofEmpires"
Remove-App "*toolbar*"
Remove-App "06DAC6F6.StumbleUpon"
Remove-App "09B6C2D8.TheTreasuresofMontezuma3"
Remove-App "0D16BB98.Houzz"
Remove-App "0E3921EB.sMedioTrueDVDforHP"
Remove-App "0EB8BD08.MysteryManorhiddenobjects"
Remove-App "10084FinerCode.ChessTactics"
Remove-App "11416StephenToub.SudokuClassic"
Remove-App "11508Heptazane.GPXPlayer"
Remove-App "11610RobertVarga.StopwatchFree"
Remove-App "12176PicturePerfectApps.GIFMaker-PhotostoGIFVideot"
Remove-App "12262FiveStarGames.CrossyChickenRoad"
Remove-App "12726CosmosChong.AdvancedEnglishDictionary"
Remove-App "128374E71F94E.SamsungStore"
Remove-App "12926CandyKingStudio.StickmanWarriorsFighting"
Remove-App "134D4F5B.Box*"
Remove-App "1430GreenfieldTechnologie.PuzzleTouch*"
Remove-App "145844925F2BF.Mahjong"
Remove-App "17036IYIA.StorySaverperInstagram"
Remove-App "17539gfyjwcs.SmartDwarfs"
Remove-App "181132B7.ZUUS"
Remove-App "184MagikHub.TextizeMindMap"
Remove-App "1867LennardSprong.PortablePuzzleCollection"
Remove-App "19965MattHafner.WifiAnalyzer"
Remove-App "20815shootingapp.AirFileViewer"
Remove-App "21090PaddyXu.QuickLook"
Remove-App "2121MagicCraftGames.ExplorationLiteCraftMining"
Remove-App "2164RexileStudios.FastYoutubeDownloader"
Remove-App "21824TapFunGames.DashImpossibleGeometryLite"
Remove-App "22062EdgeWaySoftware.TheLogosQuiz"
Remove-App "22094SynapticsIncorporate.AudioControls"
Remove-App "22094SynapticsIncorporate.SmartAudio2"
Remove-App "22094SynapticsIncorporate.SmartAudio3"
Remove-App "22380CatalanHilton.SolitaireDeluxe2019"
Remove-App "22450.BestVideoConverter"
Remove-App "22546Cidade.MusicVideoMakerMiniMovie"
Remove-App "23385HappyFamilyGames.CanYouEscapeAdventure"
Remove-App "24213gaogroup.Upto8MergeBlockInHexaLinesPuzzle"
Remove-App "24712m1dfmmengesha.TestFrameworkBP052015"
Remove-App "24712m1dfmmengesha.TestFrameworkBackpublish050515"
Remove-App "24712m1dfmmengesha.TestFrameworkwin81appxneutral06"
Remove-App "24712m1dfmmengesha.mxtest2"
Remove-App "24728AkshatKumarSingh.30376E696B184"
Remove-App "25231MatthiasShapiro.BrickInstructions"
Remove-App "25529kineapps.MyCalendar"
Remove-App "25841LowtechStudios.io.Slither.io"
Remove-App "25920Bala04.Mideo-VideoPlayer"
Remove-App "26334ZenStudioGames.GachaLifeDangerousTravel"
Remove-App "26334ZenStudioGames.GachalifeStories"
Remove-App "26334ZenStudioGames.YandereSimulatorWarriorGacha"
Remove-App "26704KathyGrobbelaar.GPSRoutes"
Remove-App "26720RandomSaladGamesLLC.CribbageDeluxe"
Remove-App "26720RandomSaladGamesLLC.HeartsDeluxe*"
Remove-App "26720RandomSaladGamesLLC.Hexter"
Remove-App "26720RandomSaladGamesLLC.SimpleMahjong"
Remove-App "26720RandomSaladGamesLLC.SimpleMinesweeper"
Remove-App "26720RandomSaladGamesLLC.SimpleSolitaire*"
Remove-App "26720RandomSaladGamesLLC.SimpleSpiderSolitaire"
Remove-App "26720RandomSaladGamesLLC.Spades"
Remove-App "26720RandomSaladGamesLLC.Sudoku-Pro"
Remove-App "2703103D.McAfeeCentral"
Remove-App "27182KingdomEntertainment.Bubble.io-Agario"
Remove-App "27182KingdomEntertainment.FlippyKnife3D"
Remove-App "27182KingdomEntertainment.PixelGun3DPocketCrafting"
Remove-App "2724RoyaleDragonPacoGames.SpaceFrontierFree"
Remove-App "2724ZOLTNGUBICS.MINIGOLFCLUB"
Remove-App "2724ZOLTNGUBICS.SKYCUECLUB89BALLPOOLBILLIARDSSNOOK"
Remove-App "27345RickyWalker.BlackjackMaster3"
Remove-App "28287mfYSoftware.MiniRadioPlayer"
Remove-App "29313JVGoldSoft.5962504421940"
Remove-App "29534ukaszKurant.Logicos"
Remove-App "29534ukaszKurant.Logicos2"
Remove-App "29814LackoLuboslav.Bluetoothanalyzer"
Remove-App "29982CsabaHarmath.UnCompress*"
Remove-App "2CB8455F.Tanks"
Remove-App "2FE3CB00.PICSART-PHOTOSTUDIO"
Remove-App "2FE3CB00.PicsArt-PhotoStudio*"
Remove-App "30472FranciscoRodrigues.14392819EE0CF"
Remove-App "31653Sparkx.DrakeVideos"
Remove-App "32004CLEVERBIT.49301721A13B4"
Remove-App "32443PocketNet.Paper.io"
Remove-App "32940RyanW.Fiorini.BeyonceUltimate"
Remove-App "32940RyanW.Fiorini.PinkUltimate"
Remove-App "32988BernardoZamora.BackgammonPro"
Remove-App "32988BernardoZamora.SolitaireHD"
Remove-App "33916DoortoApps.HillClimbSimulation4x4"
Remove-App "33C30B79.HyperXNGenuity"
Remove-App "34697joal.EasyMovieMaker"
Remove-App "35229MihaiM.QuizforGeeks"
Remove-App "35300Kubajzl.MCGuide"
Remove-App "35300Kubajzl.Slitherio"
Remove-App "37162EcsolvoTechnologies.UltraStopwatchTimer"
Remove-App "37442SublimeCo.AlarmClockForYou"
Remove-App "37457BenoitRenaud.HexWar"
Remove-App "37733Eiki184.Simple-TypephotoViewer"
Remove-App "37806WilhelmsenStudios.NowyouareinOrbit"
Remove-App "39492FruitCandy.VideocompressorTrimmer"
Remove-App "39674HytoGame.TexasHoldemOnline"
Remove-App "3973catalinux.BackgammonReloaded"
Remove-App "39806kalinnikol.FreeCellSolitaireHD"
Remove-App "39806kalinnikol.FreeHeartsHD"
Remove-App "39806kalinnikol.TheSpiderSolitaireHD"
Remove-App "401053BladeGames.3DDungeonEscape"
Remove-App "40459File-New-Project.EarTrumpet"
Remove-App "40538vasetest101.TESTFRAMEWORKABO2"
Remove-App "41038AXILESOFT.ACGMEDIAPLAYER"
Remove-App "41879VbfnetApps.FileDownloader"
Remove-App "42569AlexisPayendelaGaran.OtakuAssistant"
Remove-App "4262TopFreeGamesCOC.RunSausageRun"
Remove-App "4408APPStar.RiderUWP"
Remove-App "44218hungrymousegames.Mou"
Remove-App "44352GadgetWE.UnitConversion"
Remove-App "45375MiracleStudio.Splix.io"
Remove-App "45515SkyLineGames.Backgammon.free"
Remove-App "45604EntertainmentandMusi.Open7-Zip"
Remove-App "46928bounde.EclipseManager*"
Remove-App "47404LurkingDarknessOfRoy.SimpleStrategyRTS"
Remove-App "48682KiddoTest.Frameworkuapbase"
Remove-App "48938DngVnPhcThin.Deeep.io"
Remove-App "4961ThePlaymatE.DigitalImagination"
Remove-App "4AE8B7C2.Booking.comPartnerApp"
Remove-App "4AE8B7C2.Booking.comPartnerEdition*"
Remove-App "50856m1dfLL.TestFrameworkProd06221501"
Remove-App "51248Raximus.Dobryplan"
Remove-App "5269FriedChicken.YouTubeVideosDownloader*"
Remove-App "52755VolatileDove.LovingCubeEngine-experimentaledi"
Remove-App "55407EducationLife.LearntoMicrosoftAccess2010forBe"
Remove-App "55627FortrinexTechnology.PuzzleGallery"
Remove-App "55648JonathanPierce.RemindMeforWindows"
Remove-App "5603MorganMaurice.Caf-MonCompte"
Remove-App "56081SweetGamesBox.SlitherSnake.io"
Remove-App "56489MagicTopFreeGamesLtd.FlightPilotSimulator3DSi"
Remove-App "56491SimulationFarmGames.100BallsOriginal"
Remove-App "57591LegendsSonicSagaGame.Twenty48Solitaire"
Remove-App "57689BIGWINStudio.Rider3D"
Remove-App "57868Codaapp.UploadforInstagram"
Remove-App "58033franckdakam.4KHDFreeWallpapers"
Remove-App "58255annmobile999.MusicMp3VideoDownload"
Remove-App "58539F3C.LexmarkPrinterHome"
Remove-App "5895BlastCrushGames.ExtremeCarDrivingSimulator2"
Remove-App "59091GameDesignStudio.HeartsUnlimited"
Remove-App "59091GameDesignStudio.MahjongDe*"
Remove-App "59169Willpowersystems.BlueSkyBrowser"
Remove-App "5A894077.McAfeeSecurity"
Remove-App "5CB722CC.CookingDiaryTastyHills"
Remove-App "60311BAFDEV.MyVideoDownloaderforYouTube"
Remove-App "61706EasyBrain.EscapeGame50Rooms1"
Remove-App "62535WambaDev.FastYouTubeDownloaderFREE"
Remove-App "64885BlueEdge.OneCalendar*"
Remove-App "65284GameCabbage.OffRoadDriftSeries"
Remove-App "65327Damicolo.BartSimpsonSkateMania"
Remove-App "664D3057.MahjongDeluxeFree"
Remove-App "6918E89D.THECHESSLV.100"
Remove-App "6E04A0BD.PhotoEditor"
Remove-App "6Wunderkinder.Wunderlist"
Remove-App "73F5BF5E.TwoDots"
Remove-App "7458BE2C.WorldofWarships"
Remove-App "7475BEDA.BitcoinMiner"
Remove-App "780F5C7B.FarmUp"
Remove-App "7906AAC0.TOSHIBACanadaPartners*"
Remove-App "7906AAC0.ToshibaCanadaWarrantyService*"
Remove-App "7906AAC0.TruRecorder"
Remove-App "7EE7776C.LinkedInforWindows"
Remove-App "7digitalLtd.7digitalMusicStore*"
Remove-App "81295E39.AnimalPuzzle"
Remove-App "828B5831.HiddenCityMysteryofShadows"
Remove-App "828B5831.HomicideSquadHiddenCrimes"
Remove-App "88449BC3.TodoistTo-DoListTaskManager"
Remove-App "89006A2E.AutodeskSketchBook*"
Remove-App "8bitSolutionsLLC.bitwardendesktop"
Remove-App "8tracksradio.8tracksradio"
Remove-App "9393SKYFamily.RollyVortex"
Remove-App "9426MICRO-STARINTERNATION.DragonCenter"
Remove-App "95FE1D22.VUDUMoviesandTV"
Remove-App "9E2F88E3.Twitter"
Remove-App "9FD20106.MediaPlayerQueen"
Remove-App "9FDF1AF1.HPImprezaPen"
Remove-App "A-Volute.Nahimic"
Remove-App "A025C540.Yandex.Music"
Remove-App "A278AB0D.Asphalt9"
Remove-App "A278AB0D.DisneyMagicKingdoms"
Remove-App "A278AB0D.DragonManiaLegends*"
Remove-App "A278AB0D.DungeonHunter5"
Remove-App "A278AB0D.GameloftGames"
Remove-App "A278AB0D.IronBlade"
Remove-App "A278AB0D.MarchofEmpires"
Remove-App "A278AB0D.PaddingtonRun"
Remove-App "A34E4AAB.YogaChef*"
Remove-App "A8C75DD4.Therefore"
Remove-App "A97ECD55.KYOCERAPrintCenter"
Remove-App "AD2F1837.BOAudioControl"
Remove-App "AD2F1837.BangOlufsenAudioControl"
Remove-App "AD2F1837.DiscoverHPTouchpointManager"
Remove-App "AD2F1837.GettingStartedwithWindows8"
Remove-App "AD2F1837.HPAudioCenter"
Remove-App "AD2F1837.HPBusinessSlimKeyboard"
Remove-App "AD2F1837.HPClassroomManager"
Remove-App "AD2F1837.HPConnectedMusic"
Remove-App "AD2F1837.HPConnectedPhotopoweredbySnapfish"
Remove-App "AD2F1837.HPCoolSense"
Remove-App "AD2F1837.HPDesktopSupportUtilities"
Remove-App "AD2F1837.HPFileViewer"
Remove-App "AD2F1837.HPGames"
Remove-App "AD2F1837.HPInc.EnergyStar"
Remove-App "AD2F1837.HPInteractiveLight"
Remove-App "AD2F1837.HPJumpStart"
Remove-App "AD2F1837.HPJumpStarts"
Remove-App "AD2F1837.HPPCHardwareDiagnosticsWindows"
Remove-App "AD2F1837.HPPhoneWise"
Remove-App "AD2F1837.HPPowerManager"
Remove-App "AD2F1837.HPPrimeFree"
Remove-App "AD2F1837.HPPrimeGraphingCalculator"
Remove-App "AD2F1837.HPPrivacySettings"
Remove-App "AD2F1837.HPProgrammableKey"
Remove-App "AD2F1837.HPQuickDrop"
Remove-App "AD2F1837.HPRegistration"
Remove-App "AD2F1837.HPScanandCapture"
Remove-App "AD2F1837.HPSupportAssistant"
Remove-App "AD2F1837.HPSureShieldAI"
Remove-App "AD2F1837.HPSystemEventUtility"
Remove-App "AD2F1837.HPSystemInformation"
Remove-App "AD2F1837.HPThermalControl"
Remove-App "AD2F1837.HPWelcome"
Remove-App "AD2F1837.HPWorkWell"
Remove-App "AD2F1837.HPWorkWise"
Remove-App "AD2F1837.SavingsCenterFeaturedOffers"
Remove-App "AD2F1837.SmartfriendbyHPCare"
Remove-App "AD2F1837.bulbDigitalPortfolioforHPSchoolPack"
Remove-App "AD2F1837.myHP"
Remove-App "ASUSCloudCorporation.MobileFileExplorer"
Remove-App "AccuWeather.AccuWeatherforWindows8*"
Remove-App "AcerIncorporated*"
Remove-App "AcerIncorporated.AcerCareCenter"
Remove-App "AcerIncorporated.AcerCareCenterS"
Remove-App "AcerIncorporated.AcerCollection"
Remove-App "AcerIncorporated.AcerCollectionS"
Remove-App "AcerIncorporated.AcerExplorer"
Remove-App "AcerIncorporated.AcerRegistration"
Remove-App "AcerIncorporated.PredatorSenseV30"
Remove-App "AcerIncorporated.PredatorSenseV31"
Remove-App "AcerIncorporated.QuickAccess"
Remove-App "AcerIncorporated.UserExperienceImprovementProgram"
Remove-App "AcrobatNotificationClient"
Remove-App "ActiproSoftwareLLC*"
Remove-App "ActiproSoftwareLLC.562882FEEB491"
Remove-App "Adictiz.SpaceDogRun"
Remove-App "AdobeNotificationClient"
Remove-App "AdobeSystemsIncorporated.AdobePhotoshopExpress*"
Remove-App "AdobeSystemsIncorporated.AdobeRevel*"
Remove-App "AdvancedMicroDevicesInc-2.59462344778C5"
Remove-App "AdvancedMicroDevicesInc-2.AMDDisplayEnhance"
Remove-App "AeriaCanadaStudioInc.BlockWarsSurvivalGames"
Remove-App "AeriaCanadaStudioInc.CopsVsRobbersJailBreak"
Remove-App "Amazon.com.Amazon*"
Remove-App "Aol.AOLOn"
Remove-App "AppUp.IntelAppUpCatalogueAppWorldwideEdition*"
Remove-App "AppUp.IntelGraphicsExperience"
Remove-App "AppUp.IntelManagementandSecurityStatus"
Remove-App "AppUp.IntelOptaneMemoryandStorageManagement"
Remove-App "AppUp.ThunderboltControlCenter"
Remove-App "AppleInc.iCloud"
Remove-App "B9ECED6F.ASUSBatteryHealthCharging"
Remove-App "B9ECED6F.ASUSCalculator"
Remove-App "B9ECED6F.ASUSFiveinARow"
Remove-App "B9ECED6F.ASUSGIFTBOX*"
Remove-App "B9ECED6F.ASUSPCAssistant"
Remove-App "B9ECED6F.ASUSProductRegistrationProgram"
Remove-App "B9ECED6F.ASUSTutor"
Remove-App "B9ECED6F.ASUSTutorial"
Remove-App "B9ECED6F.ASUSWelcome"
Remove-App "B9ECED6F.ArmouryCrate"
Remove-App "B9ECED6F.AsusConverter"
Remove-App "B9ECED6F.GameVisual"
Remove-App "B9ECED6F.MyASUS"
Remove-App "B9ECED6F.TheWorldClock"
Remove-App "B9ECED6F.eManual"
Remove-App "BD9B8345.AlbumbySony*"
Remove-App "BD9B8345.MusicbySony*"
Remove-App "BD9B8345.Socialife*"
Remove-App "BD9B8345.VAIOCare*"
Remove-App "BD9B8345.VAIOMessageCenter*"
Remove-App "BethesdaSoftworks.FalloutShelter"
Remove-App "BooStudioLLC.8ZipLite"
Remove-App "BooStudioLLC.TorrexLite-TorrentDownloader"
Remove-App "BrowseTechLLC.AdRemover"
Remove-App "C27EB4BA.DROPBOX"
Remove-App "C27EB4BA.DropboxOEM"
Remove-App "COMPALELECTRONICSINC.AlienwareOSDKits"
Remove-App "COMPALELECTRONICSINC.AlienwareTypeCaccessory"
Remove-App "COMPALELECTRONICSINC.Alienwaredockingaccessory"
Remove-App "ChaChaSearch.ChaChaPushNotification*"
Remove-App "CirqueCorporation.DellPointStick"
Remove-App "ClearChannelRadioDigital.iHeartRadio*"
Remove-App "CrackleInc.Crackle*"
Remove-App "CreativeTechnologyLtd.SoundBlasterConnect"
Remove-App "CyberLink.PowerDirectorforMSI"
Remove-App "CyberLinkCorp.ac.AcerCrystalEye*"
Remove-App "CyberLinkCorp.ac.PhotoDirectorforacerDesktop"
Remove-App "CyberLinkCorp.ac.PowerDirectorforacerDesktop"
Remove-App "CyberLinkCorp.ac.SocialJogger*"
Remove-App "CyberLinkCorp.hs.PowerMediaPlayer14forHPConsumerPC"
Remove-App "CyberLinkCorp.hs.YouCamforHP*"
Remove-App "CyberLinkCorp.id.PowerDVDforLenovoIdea*"
Remove-App "CyberLinkCorp.ss.SCamera"
Remove-App "CyberLinkCorp.ss.SGallery"
Remove-App "CyberLinkCorp.ss.SPlayer"
Remove-App "CyberLinkCorp.th.Power2GoforLenovo"
Remove-App "CyberLinkCorp.th.PowerDVDforLenovo"
Remove-App "D52A8D61.FarmVille2CountryEscape*"
Remove-App "D5BE6627.CompuCleverITHMBViewer"
Remove-App "D5BE6627.UltraBlu-rayPlayerSupportsDVD"
Remove-App "D5BE6627.UltraDVDPlayerPlatinum"
Remove-App "D5EA27B7.Duolingo-LearnLanguagesforFree*"
Remove-App "DB6EA5DB.CyberLinkMediaSuiteEssentials*"
Remove-App "DB6EA5DB.MediaSuiteEssentialsforDell"
Remove-App "DB6EA5DB.Power2GoforDell"
Remove-App "DB6EA5DB.PowerDirectorforDell"
Remove-App "DB6EA5DB.PowerMediaPlayerforDell"
Remove-App "DBA41F73.ColorNoteNotepadNotes"
Remove-App "DTSInc.51789B84BE3D7"
Remove-App "DTSInc.DTSCustomforAsus"
Remove-App "DTSInc.DTSHeadphoneXv1"
Remove-App "DailymotionSA.Dailymotion*"
Remove-App "DellInc.AlienwareCommandCenter"
Remove-App "DellInc.AlienwareCustomerConnect"
Remove-App "DellInc.AlienwareProductRegistration"
Remove-App "DellInc.DellCinemaGuide"
Remove-App "DellInc.DellCommandUpdate"
Remove-App "DellInc.DellCustomerConnect"
Remove-App "DellInc.DellDigitalDelivery"
Remove-App "DellInc.DellGettingStartedwithWindows8"
Remove-App "DellInc.DellHelpSupport"
Remove-App "DellInc.DellPowerManager"
Remove-App "DellInc.DellProductRegistration"
Remove-App "DellInc.DellShop"
Remove-App "DellInc.DellSupportAssistforPCs"
Remove-App "DellInc.DellUpdate"
Remove-App "DellInc.MyDell"
Remove-App "DellInc.PartnerPromo"
Remove-App "DellPrinter.DellDocumentHub"
Remove-App "DeviceDoctor.RAROpener"
Remove-App "DevolverDigital.MyFriendPedroWin10"
Remove-App "DolbyLaboratories.DolbyAccess*"
Remove-App "DolbyLaboratories.DolbyAtmosSoundSystem"
Remove-App "DolbyLaboratories.DolbyAtmosforGaming"
Remove-App "DolbyLaboratories.DolbyAudioPremium"
Remove-App "Drawboard.DrawboardPDF*"
Remove-App "DriverToaster*"
Remove-App "E046963F.LenovoCompanion*"
Remove-App "E046963F.LenovoSupport*"
Remove-App "E0469640.CameraMan*"
Remove-App "E0469640.DeviceCollaboration*"
Remove-App "E0469640.LenovoRecommends*"
Remove-App "E0469640.LenovoUtility"
Remove-App "E0469640.NerveCenter"
Remove-App "E0469640.YogaCameraMan*"
Remove-App "E0469640.YogaPhoneCompanion*"
Remove-App "E0469640.YogaPicks*"
Remove-App "E3D1C1C1.MEOGO"
Remove-App "E97CB0A1.LogitechCameraController"
Remove-App "ELANMicroelectronicsCorpo.ELANTouchpadSetting"
Remove-App "ELANMicroelectronicsCorpo.ELANTouchpadforThinkpad"
Remove-App "ESPNInc.WatchESPN*"
Remove-App "Ebates.EbatesCashBack"
Remove-App "EncyclopaediaBritannica.EncyclopaediaBritannica*"
Remove-App "EnnovaResearch.ToshibaPlaces"
Remove-App "Evernote.Evernote"
Remove-App "Evernote.Skitch*"
Remove-App "EvilGrogGamesGmbH.WorldPeaceGeneral2017"
Remove-App "F223684A.SkateboardParty2Lite"
Remove-App "F5080380.ASUSPowerDirector*"
Remove-App "FACEBOOK.317180B0BB486"
Remove-App "FINGERSOFT.HILLCLIMBRACING"
Remove-App "Facebook.317180B0BB486"
Remove-App "Facebook.Facebook"
Remove-App "Facebook.InstagramBeta*"
Remove-App "FilmOnLiveTVFree.FilmOnLiveTVFree*"
Remove-App "Fingersoft.HillClimbRacing"
Remove-App "Fingersoft.HillClimbRacing2"
Remove-App "FingertappsInstruments*"
Remove-App "FingertappsOrganizer*"
Remove-App "FishingPlanetLLC.FishingPlanet"
Remove-App "Flipboard.Flipboard*"
Remove-App "FreshPaint*"
Remove-App "GAMELOFTSA.Asphalt8Airborne*"
Remove-App "GAMELOFTSA.DespicableMeMinionRush"
Remove-App "GAMELOFTSA.GTRacing2TheRealCarExperience"
Remove-App "GAMELOFTSA.SharkDash*"
Remove-App "GIANTSSoftware.FarmingSimulator14"
Remove-App "GIANTSSoftware.FarmingSimulator16"
Remove-App "GREYSPRINGS.GSKIDSPRESCHOOLLETTERS"
Remove-App "GameCircusLLC.CoinDozer"
Remove-App "GameGeneticsApps.FreeOnlineGamesforLenovo*"
Remove-App "GettingStartedwithWindows8*"
Remove-App "GoogleInc.GoogleSearch"
Remove-App "HPConnectedMusic*"
Remove-App "HPConnectedPhotopoweredbySnapfish*"
Remove-App "HPRegistration*"
Remove-App "HuluLLC.HuluPlus*"
Remove-App "ICEpower.AudioWizard"
Remove-App "InsightAssessment.CriticalThinkingInsight"
Remove-App "JigsWar*"
Remove-App "K-NFBReadingTechnologiesI.BookPlace*"
Remove-App "KasperskyLab.KasperskyNow*"
Remove-App "KeeperSecurityInc.Keeper"
Remove-App "KindleforWindows8*"
Remove-App "Kortext.Kortext"
Remove-App "LGElectronics.LGControlCenter"
Remove-App "LGElectronics.LGEasyGuide2.0"
Remove-App "LGElectronics.LGOSD3"
Remove-App "LGElectronics.LGReaderMode"
Remove-App "LGElectronics.LGTroubleShooting2.0"
Remove-App "LenovoCorporation.LenovoID*"
Remove-App "LenovoCorporation.LenovoSettings*"
Remove-App "MAGIX.MusicMakerJam*"
Remove-App "MAXONComputerGmbH.Cinebench"
Remove-App "MSWP.DellTypeCStatus"
Remove-App "McAfeeInc.01.McAfeeSecurityAdvisorforDell"
Remove-App "McAfeeInc.05.McAfeeSecurityAdvisorforASUS"
Remove-App "McAfeeInc.06.McAfeeSecurityAdvisorforLenovo"
Remove-App "Mobigame.ZombieTsunami"
Remove-App "MobileFileExplorer*"
Remove-App "MobilesRepublic.NewsRepublic"
Remove-App "MobirateLtd.ParkingMania"
Remove-App "MusicMakerJam*"
Remove-App "NAMCOBANDAIGamesInc.PAC-MANChampionshipEditionDXfo*"
Remove-App "NAVER.LINEwin8*"
Remove-App "NBCUniversalMediaLLC.NBCSportsLiveExtra*"
Remove-App "NORDCURRENT.COOKINGFEVER"
Remove-App "NevosoftLLC.MushroomAge"
Remove-App "NextGenerationGames.WildDinosaurSniperHuntingHuntt"
Remove-App "NextIssue.NextIssueMagazine"
Remove-App "Nordcurrent.CookingFever"
Remove-App "OCS.OCS"
Remove-App "Ookla.SpeedtestbyOokla"
Remove-App "OrangeFrance.MaLivebox"
Remove-App "OrangeFrance.MailOrange"
Remove-App "OrangeFrance.TVdOrange"
Remove-App "PLRWORLDWIDESALES.TOWNSHIP"
Remove-App "PLRWorldwideSales.Gardenscapes-NewAcres"
Remove-App "PORTOEDITORA.EVe-Manuais"
Remove-App "PandoraMediaInc.29680B314EFC2"
Remove-App "PhotoAndVideoLabsLLC.MakeaPoster-ContinuumMediaSer"
Remove-App "PinballFx2*"
Remove-App "Pinterest.PinItButton"
Remove-App "Playtika.CaesarsSlotsFreeCasino*"
Remove-App "Pleemploi.Pleemploi"
Remove-App "PortraitDisplays.DellCinemaColor"
Remove-App "Priceline"
Remove-App "PricelinePartnerNetwork.Booking.comAPACBigsavingso"
Remove-App "PricelinePartnerNetwork.Booking.comBigsavingsonhot"
Remove-App "PricelinePartnerNetwork.Booking.comEMEABigsavingso"
Remove-App "PricelinePartnerNetwork.Booking.comUSABigsavingson"
Remove-App "PricelinePartnerNetwork.Priceline.comTheBestDealso"
Remove-App "PublicationsInternational.iCookbookSE*"
Remove-App "ROBLOXCorporation.ROBLOX"
Remove-App "RVAppStudios.PicstoWordPro-WordGames"
Remove-App "RandomSaladGamesLLC.GinRummyProforHP*"
Remove-App "RandomSaladGamesLLC.HeartsforHP"
Remove-App "ReaderNotificationClient"
Remove-App "RealFightingLLC.JurassicCityWalk"
Remove-App "RealtekSemiconductorCorp.HPAudioControl"
Remove-App "RealtekSemiconductorCorp.RealtekAudioControl"
Remove-App "Relay.com.KiosqueRelay"
Remove-App "RivetNetworks.KillerControlCenter"
Remove-App "RivetNetworks.SmartByte"
Remove-App "RollingDonutApps.JewelStar"
Remove-App "RoomAdjustment"
Remove-App "RubenGerlach.Solitaire-Palace"
Remove-App "SAMSUNGELECTRONICSCO.LTD.OnlineSupportSService"
Remove-App "SAMSUNGELECTRONICSCO.LTD.PCGallery"
Remove-App "SAMSUNGELECTRONICSCO.LTD.PCMessage"
Remove-App "SAMSUNGELECTRONICSCO.LTD.SamsungPCCleaner"
Remove-App "SAMSUNGELECTRONICSCO.LTD.SamsungPrinterExperience"
Remove-App "SAMSUNGELECTRONICSCO.LTD.Wi-FiTransfer"
Remove-App "SAMSUNGELECTRONICSCoLtd.SamsungFlux"
Remove-App "STMicroelectronicsMEMS.DellFreeFallDataProtection"
Remove-App "ScreenovateTechnologies.DellMobileConnect"
Remove-App "SegaNetworksInc.56538047DFC80"
Remove-App "ShazamEntertainmentLtd.Shazam*"
Remove-App "SilverCreekEntertainment.HardwoodHearts"
Remove-App "SkisoSoft.FireEngineSimulator"
Remove-App "SkisoSoft.TrashTruckSimulator"
Remove-App "SocialQuantumIreland.WildWestNewFrontier"
Remove-App "SolidRhino.SteelTactics"
Remove-App "SonicWALL.MobileConnect"
Remove-App "SpotifyAB.SpotifyMusic"
Remove-App "SprakelsoftUG.CrocsWorld"
Remove-App "SprakelsoftUG.FlapFlapFlap"
Remove-App "SymantecCorporation.5478111E43ACF"
Remove-App "SymantecCorporation.NortonSafeWeb"
Remove-App "SymantecCorporation.NortonStudio*"
Remove-App "SynapticsIncorporated.SynHPCommercialDApp"
Remove-App "SynapticsIncorporated.SynHPCommercialStykDApp"
Remove-App "SynapticsIncorporated.SynHPConsumerDApp"
Remove-App "TOSHIBATEC.ToshibaPrintExperience"
Remove-App "TeenGamesLLC.HelicopterSimulator3DFree-ContinuumRe"
Remove-App "TelegraphMediaGroupLtd.TheTelegraphforLenovo*"
Remove-App "TelltaleGames.MinecraftStoryMode-ATelltaleGamesSer"
Remove-App "TheNewYorkTimes.NYTCrossword*"
Remove-App "ThumbmunkeysLtd.PhototasticCollage"
Remove-App "ThumbmunkeysLtd.PhototasticCollage*"
Remove-App "ToshibaAmericaInformation.ToshibaCentral*"
Remove-App "Trapped.CanYouEscape"
Remove-App "Trapped.CanYouEscape2"
Remove-App "TreeCardGames.HeartsFree"
Remove-App "TriPlayInc.MyMusicCloud-Toshiba"
Remove-App "TripAdvisorLLC.TripAdvisorHotelsFlightsRestaurants*"
Remove-App "TuneIn.TuneInRadio*"
Remove-App "UniversalMusicMobile.HPLOUNGE"
Remove-App "UptoElevenDigitalSolution.mysms-Textanywhere*"
Remove-App "VectorUnit.BeachBuggyRacing"
Remove-App "Vimeo.Vimeo*"
Remove-App "VitalSourceTechnologiesIn.VitalSourceBookshelf"
Remove-App "WavesAudio.MaxxAudioProforDell2019"
Remove-App "WavesAudio.MaxxAudioProforDell2020"
Remove-App "WavesAudio.WavesMaxxAudioProforDell"
Remove-App "Weather.TheWeatherChannelforHP*"
Remove-App "Weather.TheWeatherChannelforLenovo*"
Remove-App "WeatherBug.a.WeatherBug"
Remove-App "WhatsNew"
Remove-App "WildTangentGames*"
Remove-App "WildTangentGames.-GamesApp-"
Remove-App "WildTangentGames.63435CFB65F55"
Remove-App "WinZipComputing.WinZipUniversal*"
Remove-App "XINGAG.XING"
Remove-App "XLabzTechnologies.22450B0065C6A"
Remove-App "XeroxCorp.PrintExperience"
Remove-App "YahooInc.54977BD360724"
Remove-App "YouSendIt.HighTailForLenovo*"
Remove-App "ZapposIPInc.Zappos.com"
Remove-App "ZeptoLabUKLimited.CutTheRope"
Remove-App "ZhuhaiKingsoftOfficeSoftw.WPSOffice"
Remove-App "ZhuhaiKingsoftOfficeSoftw.WPSOffice2019"
Remove-App "ZhuhaiKingsoftOfficeSoftw.WPSOfficeforFree"
Remove-App "ZinioLLC.Zinio*"
Remove-App "Zolmo.JamiesRecipes"
Remove-App "avonmobility.EnglishClub"
Remove-App "eBayInc.eBay*"
Remove-App "esobiIncorporated.newsXpressoMetro*"
Remove-App "fingertappsASUS.FingertappsInstrumentsrecommendedb*"
Remove-App "fingertappsASUS.JigsWarrecommendedbyASUS*"
Remove-App "fingertappsasus.FingertappsOrganizerrecommendedbyA*"
Remove-App "flaregamesGmbH.RoyalRevolt2*"
Remove-App "greysprings.GSKidsPreschoolNumbers"
Remove-App "greysprings.GSPreschoolGames"
Remove-App "king.com*"
Remove-App "king.com.BubbleWitch3Saga"
Remove-App "king.com.CandyCrushFriends"
Remove-App "king.com.CandyCrushJellySaga"
Remove-App "king.com.CandyCrushSaga"
Remove-App "king.com.CandyCrushSodaSaga"
Remove-App "king.com.FarmHeroesSaga"
Remove-App "king.com.ParadiseBay"
Remove-App "n-tvNachrichtenfernsehenG.n-tvNachrichten"
Remove-App "rara.com.rara.com"
Remove-App "sMedioforHP.sMedio360*"
Remove-App "sMedioforToshiba.TOSHIBAMediaPlayerbysMedioTrueLin*"
Remove-App "stadia.google.com-ACF4BC0B"
Remove-App "www.cyberlink.com.AudioDirectorforLGE"
Remove-App "www.cyberlink.com.ColorDirectorforLGE"
Remove-App "www.cyberlink.com.PhotoDirectorforLGE"
Remove-App "www.cyberlink.com.PowerDirectorforLGE"
Remove-App "www.cyberlink.com.PowerMediaPlayerforLGE"
Remove-App "zuukaInc.iStoryTimeLibrary*"

# Inactive identifers
#Remove-App "Netflix*"
#Remove-App "4DF9E0F8.Netflix"

##########
# Finish #
##########
# DO NOT REMOVE OR CHANGE (needs to be at end of script)
# Waits for Apps to be removed before Script Closes
Write-Output 'Finishing app removal, please wait...'
Wait-Job -Name "TronScript3rd*" | Out-null
Remove-Job -Name "TronScript3rd*" | Out-null
