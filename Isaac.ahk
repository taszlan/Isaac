#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance Force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
FileEncoding UTF-8

global maxLines := 20
global isChooseTemplate := 1
global chosenTemplate := 0
global LastMouseTipMsg := ""
global EnableTooltips := 1

Class Template{
    TemplateTitle := ""
    ArrayOfLines := []

	ShowTemplate(){
		string := "Tytuł: " . this.templateTitle . "`n"

		for templateIndex, templateElement in this.ArrayOfLines ; Enumeration is the recommended approach in most cases.
		{
				string := string . "Line " . templateIndex . " Variants:" . templateElement.ShowSentences() . "`n"

		}
	}
}

Class SingleLine{
    ArrayOfSentences := []
    CurrentPosition := 1

    GetCurrentSentence(){
        return this.ArrayOfSentences[this.CurrentPosition]
    }

	GetNextSentence(){
        this.CurrentPosition := this.CurrentPosition +1
        if(this.CurrentPosition > this.ArrayOfSentences.Length()){
            this.CurrentPosition := 1
        }
		if(EnableTooltips == 1){
			Tip(this.ArrayOfSentences[this.CurrentPosition])
		}
        return this.ArrayOfSentences[this.CurrentPosition]
    }

	ShowSentences(){
		tmpString := ""
		for sentenceIndex, sentenceElement in this.ArrayOfSentences ; Enumeration is the recommended approach in most cases.
		{
			tmpString := tmpstring . " " . sentenceIndex . " " sentenceElement
		}
		MsgBox % tmpString
	}

	Reset(){
			this.CurrentPosition := 1
	}

}

;Wczytywanie pliku wzory.txt
FileObject := FileOpen("templates.txt", "r")

if !IsObject(FileObject)
{
    MsgBox Can't open file.
    return
}
Data := FileObject.Read()

;Podział na wzorce poszczególnych okolic, na razie tablica stringów
Position := 1
SingleTemplateString := ""
AllTemplatesString := []

while Position := RegExMatch(Data, "s)<template>\R(.+?)\R</template>", SingleTemplateString, Position + StrLen(SingleTemplateString)){
    AllTemplatesString.Push(SingleTemplateString1)
}

;Przerabianie tablicy stringów na tablicę obiektów
AllTemplatesObjects := []

for index, element in AllTemplatesString {
	Position := 1
	SingleTemplateTitle := ""
	temporaryTemplate := new Template

	;Wygrzebuje tytuł z tablicy stringów
	Position := RegExMatch(element, "s)<title>\R(.+?)\R</title>", SingleTemplateTitle, Position + StrLen(SingleTemplateTitle))
	temporaryTemplate.TemplateTitle := Trim(SingleTemplateTitle1, "`r`n")

	;Dzieli resztę na substringi ograniczone znakiem nowej linii
	temporaryStringArray := StrSplit(Trim(SubStr(element, Position + StrLen(SingleTemplateTitle)), "`r`n"), "`n")

	;Przerabia substringi na obiekty, ogranicza znakiem |, brzydki kod ale kod
	temporaryArrayOfLines := []
	for i1, e1 in temporaryStringArray{
		temporarySingleLine := new SingleLine
		temporarySingleLine.ArrayOfSentences := StrSplit(e1, "|")
		for i2, e2 in temporarySingleLine.ArrayOfSentences{
			temporarySingleLine.ArrayOfSentences[i2] := Trim(e2, "`r`n")
		}
		temporaryTemplate.ArrayOfLines.Push(temporarySingleLine)
	}
	AllTemplatesObjects.Push(TemporaryTemplate)
}

pasteCreatedTemplate(template){
		result := template.TemplateTitle . "`n`n"
		for PCTindex, PCTline in template.ArrayOfLines{
			;usuwanie pustych linii
			singleSentence := PCTline.GetCurrentSentence()
			if(singleSentence != ""){
				result := result . singleSentence . "`n"
			}
		}
		SendInput, %result%
}

clearPreviousSelections(CPStemplate){
	for CPSindex, CPSline in CPStemplate.ArrayOfLines{
			CPSline.Reset()
		}
}


MouseTipUpdateInterval := 10

Tip(tip, duration = 0)
{
  global Tooltip

  Tooltip := tip
  TurnMouseTipOn()
  ForceMouseTipUpdate()

  if (duration == 0)
    duration := 100 * StrLen(Tooltip)

  SetTimer, HideMouseTip, %duration%
}

TurnMouseTipOn()
{
  global MouseTipUpdateInterval

  SetTimer, ShowMouseTip, %MouseTipUpdateInterval%
  Sleep % MouseTipUpdateInterval * 2
}

TurnMouseTipOff()
{
  SetTimer, ShowMouseTip, Off
  SetTimer, HideMouseTip, Off
  ToolTip,
}

ForceMouseTipUpdate()
{
  ForceMouseTipUpdateDelayed()
  SetTimer, ShowMouseTip, 1 ; "undelayed"
}

ForceMouseTipUpdateDelayed()
{
  global LastMouseTipX, LastMouseTipY

  LastMouseTipX := LastMouseTipY := 0
}

;GUI MAGIC
width := 400
height := 400

Gui, +AlwaysOnTop -MinimizeBox -Caption +ToolWindow +0x400000
Gui, Margin, 0, 0
Gui, Color, 2A2A2A
Gui, Font, cD3D3D3, S8, Verdana
Gui, Add, Text, +E0x20 0x200 x0 y0 w%width% h22 BackgroundTrans Center GuiMove , ISAAC
Gui, Add, Text, w%width% x10 y+5 vline1, % line1 := "1: "
Gui, Add, Text, w%width% x10 y+5 vline2, % line2 := "2: "
Gui, Add, Text, w%width% x10 y+5 vline3, % line3 := "3: "
Gui, Add, Text, w%width% x10 y+5 vline4, % line4 := "4: "
Gui, Add, Text, w%width% x10 y+5 vline5, % line5 := "5: "
Gui, Add, Text, w%width% x10 y+5 vline6, % line6 := "6: "
Gui, Add, Text, w%width% x10 y+5 vline7, % line7 := "7: "
Gui, Add, Text, w%width% x10 y+5 vline8, % line8 := "8: "
Gui, Add, Text, w%width% x10 y+5 vline9, % line9 := "9: "
Gui, Add, Text, w%width% x10 y+5 vline10, % line10 := "10: "
Gui, Add, Text, w%width% x10 y+5 vline11, % line11 := "11: "
Gui, Add, Text, w%width% x10 y+5 vline12, % line12 := "12: "
Gui, Add, Text, w%width% x10 y+5 vline13, % line13 := "13: "
Gui, Add, Text, w%width% x10 y+5 vline14, % line14 := "14: "
Gui, Add, Text, w%width% x10 y+5 vline15, % line15 := "15: "
Gui, Add, Text, w%width% x10 y+5 vline16, % line16 := "16: "
Gui, Add, Text, w%width% x10 y+5 vline17, % line17 := "17: "
Gui, Add, Text, w%width% x10 y+5 vline18, % line18 := "18: "
Gui, Add, Text, w%width% x10 y+5 vline19, % line19 := "19: "
Gui, Add, Text, w%width% x10 y+5 vline20, % line20 := "20: "
Gui, Show, w%width% h%height% , myGui
WinSet, Transparent, 200, myGui
Return

uiMove:
PostMessage, 0xA1, 2,,, A
Return

F12::Reload
GuiEscape:
Exitapp
GuiClose:
ExitApp

ShowMouseTip:
  SetTimer, ShowMouseTip, %MouseTipUpdateInterval%
  CoordMode Mouse, Relative
  MouseGetPos, xpos, ypos

  if (LastMouseTipMsg != Tooltip || LastMouseTipX != xpos || LastMouseTipY != ypos)
  {
    LastMouseTipMsg := Tooltip
    LastMouseTipX := xpos
    LastMouseTipY := ypos
    tip := Tooltip
    ToolTip, %tip%, xpos + 25, ypos + 10
  }
  return

HideMouseTip:
  TurnMouseTipOff()
  Tooltip := ""
  return

populateWithTemplates(templatesToPopulate)
{
	numberString := ""
		for PWTindex, PWTelement in templatesToPopulate{
			line%PWTindex% := PWTindex . ": " . PWTelement.TemplateTitle
			GuiControl,, line%PWTindex%, % line%PWTindex%
		}
		i := templatesToPopulate.MaxIndex() + 1
		while (i <= maxLines) {
			numberString := i . ": "
			GuiControl,, line%i%, % numberString
			i++
		}
}

populateWithLines(templates, templateNumber){
	numberString := ""
	currentTemplateArray := templates[templateNumber].arrayOfLines
		for PWLindex, PWLelement in currentTemplateArray{
			line%PWLindex% := PWLindex . ": " . PWLelement.getCurrentSentence()
			GuiControl,, line%PWLindex%, % line%PWLindex%
		}
		i := currentTemplateArray.MaxIndex() + 1
		while (i <= maxLines) {
			numberString := i . ": "
			GuiControl,, line%i%, % numberString
			i++
		}
}

shortcutFunction(templates, keyNumber){
	if(isChooseTemplate == 1){
		chosenTemplate := keyNumber
		populateWithLines(templates, chosenTemplate)
		isChooseTemplate := 0
	} else {
		tempTemplate := templates[chosenTemplate]
		tempLine := tempTemplate.ArrayOfLines[keyNumber]
		newString := keyNumber . ": " . tempLine.GetNextSentence()
		GuiControl,, line%keyNumber%, % newString
	}
return
}

;To lista skrótów klawiszowych AHK zbionfowane na Shift+Ctrl+F, jeżeli nie masz dostępu do klawiszy do F20 to przekojpij jego kod pod np. F12
;Korzystanie: okienko jest zawsze na wierzchu, można je upchnąć gdzieś w kąt
;Po uruchimieniu lista jest pusta, wczytanie wzorców to chtl+shift+F20 albo odpowiednik
;ctrl+shift+FX podmienia tekst w linii X na wpisaną dla niego alternatywę
;Jak wzorzec jest ustawiony to Chtr+Shift+F20 wkleja go w miejsce kursora (robi normalne Ctrl+V zachowując kopię tego co miałeś w schowku) i wraca do wyboru rodziaju badania

+^~F1::
shortcutFunction(AllTemplatesObjects, 1)
return

+^~F2::
shortcutFunction(AllTemplatesObjects, 2)
return

+^~F3::
shortcutFunction(AllTemplatesObjects, 3)
return

+^~F4::
shortcutFunction(AllTemplatesObjects, 4)
return

+^~F5::
shortcutFunction(AllTemplatesObjects, 5)
return

+^~F6::
shortcutFunction(AllTemplatesObjects, 6)
return

+^~F7::
shortcutFunction(AllTemplatesObjects, 7)
return

+^~F8::
shortcutFunction(AllTemplatesObjects, 8)
return

+^~F9::
shortcutFunction(AllTemplatesObjects, 9)
return

+^~F10::
shortcutFunction(AllTemplatesObjects, 10)
return

+^~F11::
shortcutFunction(AllTemplatesObjects, 11)
return

+^~F12::
shortcutFunction(AllTemplatesObjects, 12)
return

+^~F13::
shortcutFunction(AllTemplatesObjects, 13)
return

+^~F14::
shortcutFunction(AllTemplatesObjects, 14)
return

+^~F15::
shortcutFunction(AllTemplatesObjects, 15)
return

+^~F16::
shortcutFunction(AllTemplatesObjects, 16)
return

+^~F17::
shortcutFunction(AllTemplatesObjects, 17)
return

+^~F18::
shortcutFunction(AllTemplatesObjects, 18)
return

+^~F19::
shortcutFunction(AllTemplatesObjects, 19)
return

+^~F20::
if(isChooseTemplate == 0){
	pasteCreatedTemplate(AllTemplatesObjects[chosenTemplate])
	populateWithTemplates(AllTemplatesObjects)
	if(chosenTemplate != 0){
		clearPreviousSelections(AllTemplatesObjects[chosenTemplate])
	}
	isChooseTemplate := 1
} else {
	populateWithTemplates(AllTemplatesObjects)
}
return