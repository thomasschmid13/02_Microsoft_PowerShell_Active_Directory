#�ffnen sie die PowerShell mit Administratorenrechten

#Laden der Active Directory Module
Import-Module ActiveDirectory

#Anzeigen aller m�glichen ActiveDirectory Benutzer PowerShell cmdlets
Get-Command *Aduser

#Anzeigen aller MemberTypen eines ActiveDirectory Benutzers
#Mit diesem Befehl k�nnen sie alle Methoden und Eigenschaften eines AD Benutzerobjektes anzeigen (So k�nnen sie sehen was f�r Eigenschaften angezeigt oder gesetzt werden k�nnen)
Get-AdUser -Identity schmid -Properties * | Get-Member

#Anzeigen eines Active Directory Benutzers mit allen Eigenschaften
Get-AdUser -Identity schmid -Properties *

#Speichern der Werte des Active Directory Benutzers mit allen Eigenschaften in die Variable $User
$User = Get-AdUser -Identity schmid -Properties *

#Anzeigen der Methoden und Eigenschaften der Variable $User
$User | Get-Member

#Speichern des Datums der lettzen Passwort�nderung in die Variable $User
$User = Get-AdUser -Identity schmid -Properties PasswordLastSet

#Anzeigen des Datums der letzten Password�nderung aus der Variablen $User
$User | Select-Object Name, PasswordLastSet

#Anzeigen des Datums der letzten Passwort�nderung
Get-AdUser -Identity schmid -Properties PasswordLastSet | Select-Object Name, PasswordLastSet

#Alle Benutzer aus dem Active Directory auslesen
Get-AdUser -Filter * -Properties *

#Alle Benutzer aus dem Active Directory auslesen und in die Variable $AllUsers speichern
$AllUsers = Get-AdUser -Filter * -Properties *

#Anzeigen aller Benutzer mit dem Letzten Anmeldedatum und der Anzeige wann das Passwort das letzte Mal gesetzt wurde
$AllUsers = Format-Table Name, LastLogonDate, PasswordExpired, PasswordLastSet

#Erstellen eines neuen Benutzers names Kuster Kevin
#Das Passwort kann eingegeben werden
New-AdUser -Name "Kuster Kevin" -Accountpassword (Read-Host -AsSecureString "AccountPassword") -Enabled $true

#Hilfe f�r New-AdUser cmdlet anzeigen
Get-Help New-Aduser

#Hilfe f�r New-Aduser cmdlet anzeigen mit Beispielen
Get-Help New-Aduser -Examples

