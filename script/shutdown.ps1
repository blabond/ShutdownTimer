Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName WindowsBase

# Demomodus einstellen
# $demomodus = $true  # Wenn $true, wird eine Meldung angezeigt; wenn $false oder auskommentiert, wird der PC heruntergefahren

# Base64-String des PPDonate Button
$base64Image = @"
iVBORw0KGgoAAAANSUhEUgAAAGAAAAAaCAYAAABIIVmfAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAABKYSURBVGhDxVkJdFZVkv7ee/+eP/tCEhIQDIGwGlAUUMRRREEFRXumOUx7cJtuFxTb8bjb0053O21Pu4xL2zJn9Bz1KEirLCII3Yq4sINIRBYhEEgICSHJvy/vzVf3/T/5E4Jg9yzFuf+97966VXWr6lbVDRpOA/HXb/DCsX+kpXvGae78qYh/VwhYZmr5fxFENMsenhH8P+NbXNN0HY6+rVYssEzT8zZrYc9Gxz8uCqcweoVTGiD69px8TT90q2bumgVnvxr4alxa1lmA039CjLRIPXuBzDmBnusCmWtp6A0/sxc4HY00nA4/k266F+ht7lQgOAI2vgUtHoAVOgAEv40jum2rlfT9lxmresNz08cdNmZ36JV+/J1rpiL57ZPIGj1Cq5gGvXQU4C+B5vQIixTW6UE7FSq9pTudnkf9od9d0DtP4lua2nXGQDqaLj8cpzdqOsdCi42MrGQytUAQxjLNHyseoQGOwmzcCuvgEiC05SvLqH7Idf3SZSnsE3CSuPF3Js+F1fJbrXKOW6+aDM1XwFlSNiXqZEaeTMl6B5OHTiS7RytdbqnD4HbuzTzASXB6+l2QxiU/06Kotnnt3Rp0B3lSd/Y5zpzmgeYI2oNxuJw6DCuMY23tyMrKQnFhDgKdQQyoLCaWzbebrGIMjWeU1VAbzL0rYDa8ZZqOgY95pr/xKxvJBtl5AsLv/vifHVbjb/Xqn0KvPM+eNEVJZyp0Bjgc+GDVZry5cA38WR4qRQyhIcvvxuBB5Zg4biSGVpWl6Kegxzm+H3oeGoglNby4rAnbG6Nw0ntN8VT2+T4HRpa7MWlkDvoWOk82Qk++/I4mNPz81Xq8sC2E+87Lxj1T87Fh27dwGA7U7dqPwlwf5vzocug4jRPR4aQ3D6yHufsPZOO/23XdsufsdZu1gtiSWVMQ3b/EqLrNqVeOYZpNnKQMOU96hziwQkhdPRvs0CJTSXr//U+8jqef/5LzfowZm4emI1Ecqm/jtwidha1r52LUsEqlkGSSe9nLP8PQKXfqipOY5DZFW4yocOjVEh7UPFc4Lzybjicx7qUm7A8Rz2ug1qNhS5DjCFvCwowKJ165sRhFuQ5VRgh5i4fSuJn+kuJBlqTd0JrA2JePoLHTxMKr83D1WB927DkKh8upjBsKhjBqSAUMWxEnIBWduoH61h28BZth7nkhYjn6T3dNX7hSrclP7N05fs3cuUYrmVprVF1GIpRCaTsFgtWdT9oOXWupXhnA0NDYEsTVN83HpvUt+PVjF+JnP7mMzp7AijU7MOvWxUSOY+H8azDh/OF476PN2Fd/jNc6pMJTeWkOJo2vwdhzBmDHtw34bEMdnE4XZkwZi8I8D/cCzW1RLP1oA2KxCAYNrMClFw7FOua9C95sV+vvT/PjkuEuBGiMF1aH8Ktdcbq1ha1zshlIdfy5Lor97SaScRMul47qIgOThzkxqIyhg3ZdU5fAxW938iZr2H5jDoZX0td5wwQMns8Oc9RT18FTkFZIGlLfkj9oCXPPKljNy7fo7mETjateCSgX0sy9P4KzrFYrH80EEoIZY4uzekqEYbGZPKTJxCJzViKk5pL8Vo1rmb3sRzKC+vpDVP4xUtcxdkQ58nIsFOQbqCjJ4pwtuNvtxMqPt+D2e99H0+FmziTx1Y5GPPjLzzDuihexfsseJBIJ/Oy+D3DL3YtxsOGIoi28Xl/0CW6euwC/+I8tGFieR1mD2LYvyLMyzNHzaysSyHYHUJYXQZlf3J0s3Rri8QRe/ksA920JIxpOIElFLjkYwx1rwpj1RicON5MGz7ltPxMpaU3N01Du55g60clDmhUNsNqx8ZSulH44Fh2JvqRXY+ltXQoeONbKRrOS7FMb61x7PSWCHt34hhO68ybN1496iSkFaskwNFE+N6pNZKoa54Vp15z03ZsYDRRoe91Boc9Q4IXTMFC/9zBWf7wTT730MScNDBtVhJGDijG6phT7v7wXv3t0Bh6eewUemXc58sv8xHHh0MEjKM93YfDQciGExqZm9jHeiN34+SOfcVyMRc9ciQHlHoQ6gth0gGGTDjw5GwgEo9hbH8eCz2J4YodtgAfOsjAgL4Tbx0XRdLOFJ6YDj0018cho+iGNszFioaMjjHAwjC/qSYvOO6HMQp7LVqDoRnTS1eTMoqu0LtiruR5jpU97v+gYomvDPfvFCYxgsaW3jNTi+79A3hif5mWpmcPDUmHdQlA36HnF0iBzdvwPk8ftT6zEawuaOCeXTNY4CXoSFTtzaikenzsRg/rlY2NdM9Zvq8emr5vR3BpCW9DCN4diCDXFsHnpdAwZWIjbHv2AHn8QL/9mHGZcNhQ/ue89rPikBfOfugg3zRjBfBTHvhYnBi702nLLBROPlxajQIxaDw9M4J5JEeg82+f7XNhwUMPXLRpoJxwh/lZGqEncvugfwmgPaRj4Njdx70eXx3DZcHpyKvz81SCKScRhdRyCFWmF1fZFKB5Nnu/Qkm3nQHf7RHlW+Cit1Ak9uy+vCQXIfPDa+rUPmM4y6bkMkATWzGu8+ssW+cKPry1AbU0Ry1ELffJcqO6fj5HVJfC4XXjylbV4/OntcDMs/eaWszFqcDWWrz2ATZvqceEFOahgxeLVYqiukBuhY8vOo2ho3qCUf9eNZ+PvLx0ILcZQoJvY18QsSmXSvphXaaLSF6f+NfT1W6jpE8ewvlG0BF247f0sLKVfTCu2cP2gGCpyEnhmkwdbwwYmlsRR4A7iy10Mk1R+NlUwoJBE42wZqjjp3L3ooducxH/eGJPKZ/yUCeZJvw9Gy1BHoPPAEH8OFS7hQ3bRAGb0ODQ/S0Q3Y6t6fKS4C1GBNOHeGLOC2VtPRR0QRsA/XTcEF48uYzxMpooWbtKSVOYhKn8nv91Y9MS5mDbxLLR3xvH28t2cM/F35xYgz0O+vOLV/RlTGFv+8CceoDOBoSPyMG/WcPgdUZ7HroA2NYiswGBe3nvPb0MFQ41pSrWUEprdX77xYWmzhtwsC/9+yTEMLg9iZ6Mf30Tpf2Q1ppQyM3ZvOZyrtlybm0CpR/SR4PbvOXSKxQlIL6d1FzkOK3iYPHjNUu8DvmoRTui1utepl6i7qpIKmxiCBrBad8A6+jUgVosFOC9eQAGliRUTMiZBGatmj5NMmuu2S6wmVHhQVSZXmc9zxr9klC0iOSRKuRhjIbWfA++u3Itfv7wOsx9cjT++JTdHR+3gfDg14pBvvxLGBhGa1YoY4vl7hmNAHyfpMaSYURwPaPiwkfW9pePS/CSK3FRanNedMiZjvAlsSl51e3W0k9b8Tbl4bHk5piwvxHcx0uVjq6YogOMsfBY38RqZOi7ok4DPYKxXZ0uftWfPJnpI60bGoismanQcpg63wzpWx+8OzjMExzkveqbVyLVIiy2a+JJm+H4KLY9Ttint153IK3ancTQXLIOK1ERhYt60ibubXkrzEHX24uI2HGxMoGagAzdNoSLFETJQxWNjDEkLPm3DwrVJ2iOJCcPAR5KGHfsMVZncNTMPVX1cCvcr3qZRt0pFpeGFuQZuu7JIsRb5HHoS+9rL8eyOkertcUV5M6YN2MgXsSrsT4ChmWgO5eKVnbX4tD0XHt7CKwpbEUk6sS/sQ5k7hrtHfYamYAme+3qYylg3V+/DmOKdpCVe+wOAhtDoGGIMS5WfutKYqCCtOSYDdIZa59MAF87TdPfvrWROhpZSaGlsNZ8ZBE8Ngip1tjxuxJDKgF1sT4BKI7qBjrCY3UIOS0eZSjBsqCXuk0dOe0LHo28CL/DpcPNVOp6aDeQ4EvZfRhQRi28znQelwslbp2I1S5ymB09Z0xNIMEl0xgtpuCiyHW00tov7DaKL1DGO+UhTYULuGr35rwa5rbZ8vYIjgLAVfUDreOui6zwufZEV9VB59uHTWzKP0JPMqUiL0lMPVNsYCqmLkhrxR9aUgURR8m0jnkAVSRje8exHTjz8qoGifhbWPpTAoIIk3wayr4u2pl6jqf08gz1KEcoAmdGpaMYNGYmkbKl9XLXPz+8Tr1t7Lg0ySq+cEhSSYNn7RE71KWM2tcK8pLkjCFrWTG3fq+OGlOU612sRPZvVXHqfDV1y9AAuiGCKIsdqnT8cytHCPJgox80Jn8NUyTAtkxwwLVT6cKJAe0TgQP6IJzY8FmVIOuJQ+EU+E0NKmAwTGr2YYZR69Bn0/tTONF2RQfaraSUbByneUc4n2PxGUoWrMJuHvElGgS6KF3R2tmw0kdpuj+VX+AmerKszCdjLdp8Jir8M+JNelykn93utzoYOa6xaDr930RIjjqvMQC9XLpNoJkMBRTRFlcACCLuOuvDA4lzUlFrqzTauKoYrRwTgotAieIghJRR1wO9JwG3QODxInDV2gkTVX0DY+11UtBiNpMMJQ815nUmma7vi2djgxbINXtw5pQM5bs7ToxIMQ+0sJZ3UZo6bISotqwDHDoeFlTuz8ciyLDw/M4Cq0jDuX1SIx6e1sxTlA1Rkixt8wzhYfjJQsbSVcCjyerlXiMSZmD2UWeYcxHelLZcJaasovaRATfEnpSrd70BU11dlz9w9RQW7ededlXQ7tRv4TmcQFiOIJs600edTY4Pxt6ndgd+v8uOlWW2o7RvCnPm5GN3PxKDiTuxu8eKpZfnYvN+FT3d5UVMeQ76Hr87v/Hjyg1zsbvLg5dVZGNUvjrLsIBranHjt81ys2+PGkm1e1FaG4XGwVF2Xi1+sdKHAY2BEGas2hpX//LQAG/e58d5mL0pyLfTN5ctT/hSekk1nRVV3yItn3nWjOeDEyP5xLP/CgyuGB1GQFUFdkxe/+zAfWyjbl7u96t3gdcTw9KpCVUQ0tLkomx/DKmP4l8UFGF4eRaE3QtJpHaRbmmfmXGreZH6S2sDnYvjBQ08t2PG1itbLdgbeNXVthc4F1ouMI5LBUy1z/L1NSrKISoA5LJiytBAGFbVjUpWJxhbamTiLN/nRLy+BX0zfz9IR+HhHFp0ihABvCp0Od1zciMpcEzsb5E/GEXpbApWFLCv9CTy73IkDfO26tSAmDurEzSNN3HlRE43QiV2NLtz9mht9cnlQnnPdbneG3CIXezb5y/ej18Zw/bkRPLQwl8lYbMfbwrW3P8+hUmN47JoDqD+qY/1eD/kHUFsWwZvrs/Dhdi++O2rQ+DlwMAeV+wN829h07cYS88SYTXj3XKNutSwGZk1f8dHh8J9E98oANz62OR5KxO83nUarns1Xp6plRXD2qtY/k2bXwGbCRN1+xu4DHryzqRSbDxkY06+DThBDiS+BhhYdB4960BrQUchEJIKZPJCbNspxBJHFKx6PMtRYESoyB39c5cHgkhCG8V2YZLkqCnVaCexs1nGoxYF4LMlcQP5FGnzOOGae28G3h9C05Re+thFixLXYaZgx4hAGZCex5hsyldtBZZXSyOIoB5tdONzOx5qLexgNzunbjldWOPgiT2De5DY88IYXl1QH4dP5tknSa0Q/qsmYoSz9TX72OCUHez2bL2yn42g4bt4/664NXJRKKwX/tuDgkTtm9D/idjtmGE4nHZBuKQwE7Kx0Ri2WNBh6DLQHnWrqzonNOLvwmPK+swrDCPDVuepbPy6rDmFS9RHG9SQiCTeK6fkD8tv55UZlQYQKCTDuS27gG4Q5YjxzyeCSAHLdYZUPvE43vjqchZo+AZRmBzBlIFB32MsQ6ERVfgh9czoV/7RccjOjSRcKsy0m81aMqEjinP58fJV2wGtEMaA4iqYOL9bszsb0kUGMH9jIfVBhaGyVk98dGFzchpoKFyac3YosvsLtys2m360JpMcSoljWGvkFSLo9fMhbtxRev2a1jWSnhW5w9J2Js3Nd2nPUZL7Z0Q4zxFgh8UsB0U/akQHMmlLR6ExgAirnUIYkk5eAJGF5l0gFIg8juzrq+nNB5p8OTO4ROpKIuU3RlTmhJ/lN8FT9n8q2Dt4coStcpbhMklY3WYlm/+cU99Ggsr+LpnyLosg3LVtSqNhgMNna+rTx0nKcrAtOqIXUTh5W9/qh5+ayJHS0tcesucUzP3ndXrThJBICre+MP8/rcD7N58kEjc94M8yExme/leCNkITyN4IwTR/udPB9uD3X0oc5U9q9wQ+RrVegt2sOls70dt3rY89ooll/7ozGHyy64fP1KawTkJb5JFj0r+P9F1c7bvC7tdmw9As0y/RptK60MxdQME/J4v8AeuOflv5/Xi5lPHU91auEzwzrC4cTz3c6I0vyJ69LxfPucFopNr0+VC+yikbqhja+0Gf2cWc5k+qWnQ7SlM8UtyfeD9n/fZB5wkxavfH8G4G61+KhpBm3sKe1w/zmuN761Tmz69LxuxcA/hvpgIc1onzwgQAAAABJRU5ErkJggg==

"@

# Bild aus Base64-String erstellen
function Get-ImageFromBase64($base64String) {
    $bytes = [Convert]::FromBase64String($base64String)
    $stream = New-Object System.IO.MemoryStream(,$bytes)
    $image = New-Object System.Windows.Media.Imaging.BitmapImage
    $image.BeginInit()
    $image.StreamSource = $stream
    $image.CacheOption = [System.Windows.Media.Imaging.BitmapCacheOption]::OnLoad
    $image.EndInit()
    $image
}

# Fenster erstellen
$window = New-Object System.Windows.Window
$window.Title = "Shutdown Timer"
$window.Width = 350
$window.Height = 370
$window.WindowStartupLocation = "CenterScreen"

# Grid für Layout erstellen
$grid = New-Object System.Windows.Controls.Grid
$window.Content = $grid

# StackPanel für den Hauptinhalt erstellen und zum Grid hinzufügen
$stackPanel = New-Object System.Windows.Controls.StackPanel
$stackPanel.Margin = "10"
$grid.Children.Add($stackPanel)

# Auswahl der Optionen
$optionLabel = New-Object System.Windows.Controls.Label
$optionLabel.Content = "Select Option:"
$optionLabel.Margin = "10,10,10,0"
$stackPanel.Children.Add($optionLabel)

# Statuscodes für die Optionen definieren
$STATUS_HOTKEY_ONLY = 0
$STATUS_SHUTDOWN_TIME = 1
$STATUS_SHUTDOWN_WINDOW_CLOSE = 2
$STATUS_SHUTDOWN_TIME_OR_WINDOW = 3

# Dropdown-Menü erstellen und die Statuscodes für die Auswahl verwenden
$optionComboBox = New-Object System.Windows.Controls.ComboBox
$optionComboBox.Margin = "10,0,10,10"
$optionComboBox.Items.Add("Send Hotkey Only")
$optionComboBox.Items.Add("Shutdown at Specific Time")
$optionComboBox.Items.Add("Shutdown after Closing a Window")
$optionComboBox.Items.Add("Shutdown at Time or Window Close")
$optionComboBox.SelectedIndex = $STATUS_HOTKEY_ONLY
$stackPanel.Children.Add($optionComboBox)

# Checkbox für Hotkey senden
$hotkeyCheckbox = New-Object System.Windows.Controls.CheckBox
$hotkeyCheckbox.Content = "Enable Hotkey Sending (F13)"
$hotkeyCheckbox.Margin = "10,0,10,10"
$hotkeyCheckbox.IsChecked = $true
$stackPanel.Children.Add($hotkeyCheckbox)

# Eingabefeld für Endzeit
$timeLabel = New-Object System.Windows.Controls.Label
$timeLabel.Content = "Enter End Time (HHmm):"
$timeLabel.Margin = "10,0,10,0"
$stackPanel.Children.Add($timeLabel)

$timeTextBox = New-Object System.Windows.Controls.TextBox
$timeTextBox.Margin = "10,0,10,10"
$stackPanel.Children.Add($timeTextBox)

# ComboBox für Fenstertitelauswahl
$windowLabel = New-Object System.Windows.Controls.Label
$windowLabel.Content = "Select Window:"
$windowLabel.Margin = "10,0,10,0"
$windowLabel.Visibility = "Collapsed"
$stackPanel.Children.Add($windowLabel)

$windowComboBox = New-Object System.Windows.Controls.ComboBox
$windowComboBox.Margin = "10,0,10,10"
$windowComboBox.Visibility = "Collapsed"
$stackPanel.Children.Add($windowComboBox)

# Label für Statusanzeige
$statusLabel = New-Object System.Windows.Controls.Label
$statusLabel.Margin = "10"
$statusLabel.Content = "Status:"
$stackPanel.Children.Add($statusLabel)

# Label für nächste Hotkey-Zeit
$nextHotkeyLabel = New-Object System.Windows.Controls.Label
$nextHotkeyLabel.Margin = "10,0,10,10"
$nextHotkeyLabel.Content = ""
$nextHotkeyLabel.Visibility = "Collapsed"
$stackPanel.Children.Add($nextHotkeyLabel)

# Button zum Starten
$startButton = New-Object System.Windows.Controls.Button
$startButton.Content = "Start"
$startButton.Margin = "10"
$startButton.IsDefault = $true  # Reagiert auf Enter-Taste
$stackPanel.Children.Add($startButton)

# Spendenbutton als Bild-Button definieren und unten rechts platzieren
$donateButton = New-Object System.Windows.Controls.Button
$donateButton.Width = 96
$donateButton.Height = 26
$donateButton.HorizontalAlignment = "Right"
$donateButton.VerticalAlignment = "Bottom"
$donateButton.Margin = "0,0,10,10"
$donateButton.Cursor = [System.Windows.Input.Cursors]::Hand
$donateButton.BorderThickness = [System.Windows.Thickness]::new(0)  # Kein Rahmen für den Button
$donateButton.Background = [System.Windows.Media.Brushes]::Transparent  # Transparenten Hintergrund setzen

# Bild für den Button festlegen
$image = New-Object System.Windows.Controls.Image
$image.Source = Get-ImageFromBase64 $base64Image
$image.Width = 96
$image.Height = 26
$donateButton.Content = $image

# Event-Handler für Klick auf den Spendenbutton (öffnet PayPal-Link)
$donateButton.Add_Click({
     Start-Process "https://www.paypal.com/donate/?hosted_button_id=WWBVUA9T97EDC"
})

# Spendenbutton ins Grid einfügen
$grid.Children.Add($donateButton)

# Variablen im Skriptbereich deklarieren
$script:shutdownTime = $null
$script:timer = $null
$script:monitorWindow = $false
$script:windowTitle = ""
$script:windowClosed = $false
$script:sendHotkey = $false
$script:endTime = $null
$script:hotkeyTimer = $null
$script:wshell = $null

# Variable im Skriptbereich deklarieren
$script:nextHotkeyTime = $null

# Funktion zum Aktualisieren der Fensterliste
function UpdateWindowList {
    $windowComboBox.Items.Clear()
    $processes = Get-Process | Where-Object { $_.MainWindowTitle -ne "" } | Sort-Object MainWindowTitle
    foreach ($proc in $processes) {
        $windowComboBox.Items.Add($proc.MainWindowTitle)
    }
    if ($windowComboBox.Items.Count -gt 0) {
        $windowComboBox.SelectedIndex = 0
    }
}

# Initial die Fensterliste aktualisieren
UpdateWindowList

# Event-Handler für die Auswahländerung im ComboBox-Menü
$optionComboBox.add_SelectionChanged({
    param($sender, $args)
    $selectedOption = $optionComboBox.SelectedItem.ToString()

    # Überprüft die ausgewählte Option und setzt die Checkbox entsprechend
    if ($selectedOption -eq "Send Hotkey Only") {
        $hotkeyCheckbox.IsChecked = $true
    } else {
        $hotkeyCheckbox.IsChecked = $false
    }

    # Sichtbarkeit der Eingabefelder steuern
    if ($selectedOption -eq "Send Hotkey Only") {
        $timeLabel.Visibility = "Visible"
        $timeTextBox.Visibility = "Visible"
        $windowLabel.Visibility = "Collapsed"
        $windowComboBox.Visibility = "Collapsed"
    } elseif ($selectedOption -eq "Shutdown at Specific Time") {
        $timeLabel.Visibility = "Visible"
        $timeTextBox.Visibility = "Visible"
        $windowLabel.Visibility = "Collapsed"
        $windowComboBox.Visibility = "Collapsed"
    } elseif ($selectedOption -eq "Shutdown after Closing a Window") {
        $timeLabel.Visibility = "Collapsed"
        $timeTextBox.Visibility = "Collapsed"
        $windowLabel.Visibility = "Visible"
        $windowComboBox.Visibility = "Visible"
    } elseif ($selectedOption -eq "Shutdown at Time or Window Close") {
        $timeLabel.Visibility = "Visible"
        $timeTextBox.Visibility = "Visible"
        $windowLabel.Visibility = "Visible"
        $windowComboBox.Visibility = "Visible"
    }

    # Status zurücksetzen
    $statusLabel.Content = "Status:"
    $nextHotkeyLabel.Content = ""
    $nextHotkeyLabel.Visibility = "Collapsed"
})
# Initiale Sichtbarkeit einstellen
$optionComboBox.SelectedIndex = $STATUS_HOTKEY_ONLY  # Standard auswählen


# Event-Handler für Start-Button
$startButton.Add_Click({
    try {
        $script:selectedOption = $optionComboBox.SelectedIndex
        $script:shutdownTime = $null
        $script:monitorWindow = $false
        $script:windowClosed = $false
        $script:windowTitle = ""
        $script:sendHotkey = $hotkeyCheckbox.IsChecked
        $script:endTime = $null

        $validInput = $true

        # Validierung der Uhrzeit
        if ($selectedOption -eq $STATUS_HOTKEY_ONLY -or $selectedOption -eq $STATUS_SHUTDOWN_TIME -or $selectedOption -eq $STATUS_SHUTDOWN_TIME_OR_WINDOW) {
            $timeInput = $timeTextBox.Text
            if ($timeInput -match '^\d{4}$') {
                $inputHour = [int]($timeInput.Substring(0,2))
                $inputMinute = [int]($timeInput.Substring(2,2))
                if ($inputHour -ge 0 -and $inputHour -lt 24 -and $inputMinute -ge 0 -and $inputMinute -lt 60) {
                    $currentDate = Get-Date
                    $script:endTime = Get-Date -Hour $inputHour -Minute $inputMinute -Second 0
                    if ($script:endTime -lt $currentDate) {
                        $script:endTime = $script:endTime.AddDays(1)
                    }
                } else {
                    $validInput = $false
                    $statusLabel.Content = "Invalid time input."
                }
            } else {
                $validInput = $false
                $statusLabel.Content = "Please enter a valid time in HHmm format."
            }
        }

        if (-not $validInput) { return }

        # Fensterüberwachung initialisieren, wenn erforderlich
        if ($selectedOption -eq $STATUS_SHUTDOWN_WINDOW_CLOSE -or $selectedOption -eq $STATUS_SHUTDOWN_TIME_OR_WINDOW) {
            $script:windowTitle = $windowComboBox.SelectedItem
            if ([string]::IsNullOrWhiteSpace($script:windowTitle)) {
                $validInput = $false
                $statusLabel.Content = "Please select a valid window."
            } else {
                $script:monitorWindow = $true
            }
        }

        if ($validInput) {
            # Hotkey-Timer starten, wenn aktiviert
            if ($script:sendHotkey) {
                $script:wshell = New-Object -ComObject wscript.shell
                $script:hotkeyTimer = New-Object System.Windows.Threading.DispatcherTimer
                $script:hotkeyTimer.Interval = [System.TimeSpan]::FromSeconds(1)
                $script:nextHotkeyTime = Get-Date

                # Das Label für die nächste Hotkey-Zeit sichtbar machen
                $nextHotkeyLabel.Visibility = "Visible"

                $script:hotkeyTimer.Add_Tick({
                    try {
                        $currentTime = Get-Date
                        if ($currentTime -ge $script:nextHotkeyTime) {
                            $script:wshell.SendKeys("{F13}")
                            # Nächste zufällige Zeit berechnen
                            $randomInterval = Get-Random -Minimum 182 -Maximum 280
                            $script:nextHotkeyTime = $currentTime.AddSeconds($randomInterval)
                        }
                        # Zeit bis zum nächsten Hotkey berechnen und anzeigen
                        $timeUntilNextHotkey = $script:nextHotkeyTime - $currentTime
                        $nextHotkeyLabel.Dispatcher.Invoke([Action]{
                            $nextHotkeyLabel.Content = "Next hotkey in: {1:D2}:{2:D2}" -f $timeUntilNextHotkey.Hours, $timeUntilNextHotkey.Minutes, $timeUntilNextHotkey.Seconds
                        })
                    } catch {
                        [System.Windows.MessageBox]::Show("Error in hotkey timer: $_", "Error", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)
                        $script:hotkeyTimer.Stop()
                        $nextHotkeyLabel.Visibility = "Collapsed"
                    }
                })
                $script:hotkeyTimer.Start()
            }

            # Haupt-Timer für die Überwachung starten
            $script:timer = New-Object System.Windows.Threading.DispatcherTimer
            $script:timer.Interval = [System.TimeSpan]::FromSeconds(1)
            $script:timer.Add_Tick({
                try {
                    $triggered = $false
                    $statusMessages = @()

                    if ($script:endTime -ne $null) {
                        $currentTime = Get-Date
                        $timeRemaining = $script:endTime - $currentTime
                        if ($timeRemaining.TotalSeconds -le 0) {
                            $triggered = $true
                            $statusMessages += "The specified end time has been reached."
                        } else {
                            $statusMessages += ("Time remaining: {0:D2}:{1:D2}:{2:D2}" -f $timeRemaining.Hours, $timeRemaining.Minutes, $timeRemaining.Seconds)
                        }
                    }

                    if ($script:monitorWindow) {
                        $processes = Get-Process | Where-Object { $_.MainWindowTitle -eq $script:windowTitle }
                        if ($processes.Count -eq 0) {
                            if (-not $script:windowClosed) {
                                $script:windowClosed = $true
                                $triggered = $true
                                $statusMessages += "The window '$($script:windowTitle)' has been closed."
                            }
                        } else {
                            $statusMessages += "`nWaiting for the window to close`n'$($script:windowTitle)'"
                        }
                    }

                    $statusLabel.Content = [string]::Join(" ", $statusMessages)

                    if ($triggered) {
                        $script:timer.Stop()
                        if ($script:hotkeyTimer -ne $null) {
                            $script:hotkeyTimer.Stop()
                            $nextHotkeyLabel.Visibility = "Collapsed"
                        }

                        # Neue Statuscode-Überprüfung beim Herunterfahren
                        if ($demomodus -eq $true) {
                            # Im Demomodus: Meldung anzeigen
                            [System.Windows.MessageBox]::Show("The action has been triggered. This is a test message instead of shutting down.", "Action Triggered", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Information)
                        } else {
                            # Überprüfen, ob eine Herunterfahren-Option ausgewählt wurde
                            if ($script:selectedOption -eq $STATUS_SHUTDOWN_TIME -or $script:selectedOption -eq $STATUS_SHUTDOWN_WINDOW_CLOSE -or $script:selectedOption -eq $STATUS_SHUTDOWN_TIME_OR_WINDOW) {
							# Im Live-Modus: PC herunterfahren
							Start-Process "shutdown.exe" -ArgumentList "/s /t 0"
							} else {
								# Falls "Send Hotkey Only" ausgewählt ist, erfolgt kein Herunterfahren
								[System.Windows.MessageBox]::Show("The hotkey sending time has expired", "Hotkey Sending Ended", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Information)
							}
                        }
                        $window.Close()
                    }
                } catch {
                    [System.Windows.MessageBox]::Show("Error in timer: $_", "Error", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)
                    $script:timer.Stop()
                    if ($script:hotkeyTimer -ne $null) {
                        $script:hotkeyTimer.Stop()
                        $nextHotkeyLabel.Visibility = "Collapsed"
                    }
                }
            })
            $script:timer.Start()
            $startButton.IsEnabled = $false
            $optionComboBox.IsEnabled = $false
            $timeTextBox.IsEnabled = $false
            $windowComboBox.IsEnabled = $false
            $hotkeyCheckbox.IsEnabled = $false
            $startButton.Visibility = "Collapsed"
        }
    } catch {
        $errorMessage = "Error: " + $_.Exception.Message
        [System.Windows.MessageBox]::Show($errorMessage, "Error", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Error)
    }
})



# Fenster anzeigen
$window.ShowDialog()