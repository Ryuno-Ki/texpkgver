# TeX Package Version 

You can simply drop the name of \usepackage package or \documentclass class
as first argument and the script will search for the installed version.

# Assumptions

 * TEXMF matches your TeX distributions' path. Most the time, it's TeXlive on
   GNU/Linux systems.
 * TeX authors have put the version at second place (after the date) in
   \ProvidesPackage resp. \ProvidesClass.

# Dependencies

 * `awk`
 * `echo`
 * `find`
 * `grep`
