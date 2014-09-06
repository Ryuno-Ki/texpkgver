#!/usr/bin/env bash
# Parses LaTeX files and returns the version of a given argument
# Alternatively, use \listfiles and walk through .log, c.f
# https://tex.stackexchange.com/a/13305
# by André Jaenisch in September 2014

TEXMF="/usr/share/texlive/texmf-dist/"
pkgpath=$(find $TEXMF -name $1.sty);

if [[ -z $pkgpath ]]; then
  clspath=$(find $TEXMF -name $1.cls);
fi

if [[ -z $pkgpath && -z $clspath ]]; then
  echo "package $1 not found";
  exit 1;
fi

if [[ ! -z $pkgpath ]]; then
  prov=$(grep ProvidesPackage "$pkgpath");
fi

if [[ -z $prov ]]; then
  prov=$(grep ProvidesClass "$clspath");
fi

pkgver=$(echo "$prov" | awk '{print $2}');
echo $pkgver;
exit 0;
