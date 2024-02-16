function Extract-Variable {
	param([string] $Path, [string] $Key)
	foreach ($Line in Get-Content $Path) {
		if ($Line.StartsWith("export $Key=")) {
			return $Line.Substring("export $Key=".Length)
		}
	}
	throw "Couldn't find value for $Key in $Path"
}

$BaseDir = Split-Path $script:MyInvocation.MyCommand.Path
$RustgVersion = Extract-Variable -Path "$BaseDir\..\..\_build_dependencies.sh" -Key "RUST_G_VERSION"

return $RustgVersion