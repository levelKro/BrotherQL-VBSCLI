# BrotherQL-VBSCLI
This script allow to print template directly to your Brother label printer. This is a helper for printing from no-compatible language, like Python.
 
## Requirements
* Brother B-Pac 3.2+
* Windows with VBS support 
 
## Usage
`print_to_ql.bat "template_name.lbs" "var1" "var2", "var3" ...`

You can also replace media by adding '@' before the file, example: `"@myimage.jpg"`

You can paste directly to VBS script also, if you need.

## Template
Use P-Touch software to create template to print. If you want replace value, name it 'varX' where X is the numeral value of this variable replacement. "var1" was replaced by the first argument (after template name), the "var2" by the second and etc...

