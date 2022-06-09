'*******************************************************************
'	Print Module to Brother QL
'   Writted by Mathieu Légaré <levelkro@yahoo.ca>
'   Usage : print_to_ql.bat "template.lbx" "var1" var2"
'   
'   Template must have 'var1', 'var2' etc.. for text to replace.
'   Afther, folow number increment to paste arguments in command.
'	If the element to replace is a image, add @ before the value. 
'		Example : @image.jpg
'*******************************************************************


sDataFolder = CreateObject("Scripting.FileSystemObject").GetAbsolutePathName(".") & "\"
sLabelImagePath = sDataFolder & sLabelImage
Set args = Wscript.Arguments
Sub DoPrint(vars)
	Set ObjDoc = CreateObject("bpac.Document")
	bRet = ObjDoc.Open(vars(0))
	Call ObjDoc.SetMediaByName(ObjDoc.Printer.GetMediaName(), True)
	If (bRet <> False) Then
		valindex=0
		Dim item
		For Each item In vars
			If valindex <> 0 Then
				itemname = "var" & valindex
				If Mid(item,1,1) = "@" Then
					Call ObjDoc.GetObject(itemname).SetData(0, Mid(item,2), 4)
				Else
					ObjDoc.GetObject(itemname).Text = item
				End If
			End If
			valindex = valindex + 1
		Next
		Call ObjDoc.SetMediaByName(ObjDoc.Printer.GetMediaName(), True)
		retval=ObjDoc.StartPrint("Label " & vars(0), 0)
		retval=ObjDoc.PrintOut(0, 0)
		ObjDoc.EndPrint
		ObjDoc.Close
	End If
	Set ObjDoc = Nothing
End Sub

DoPrint(args)