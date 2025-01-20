{ mkDerivation, aeson, ansi-terminal, ansi-wl-pprint, async, base, lib
     , boxes, bytestring, containers, directory, filepath, formatting
     , Glob, hspec, hspec-core, HUnit, language-javascript, mtl
     , optparse-applicative, process, purescript, QuickCheck, safe, text
     , transformers, unordered-containers, utf8-string
   }:

mkDerivation {
       pname = "zephyr";
       version = "0.5.3";
       sha256 = "1chfs864kayq4xfl5yz4pcwfy1zpsq9ygbvlbj3s7lifg7khyffz";
       source = ./.;
       isLibrary = true;
       isExecutable = true;
       libraryHaskellDepends = [
         aeson ansi-terminal base boxes containers formatting
         language-javascript mtl purescript safe text unordered-containers
       ];
       executableHaskellDepends = [
         aeson ansi-terminal ansi-wl-pprint async base bytestring containers
         directory filepath formatting Glob language-javascript mtl
         optparse-applicative purescript text transformers utf8-string
       ];
       testHaskellDepends = [
         aeson base containers directory hspec hspec-core HUnit
         language-javascript mtl optparse-applicative process purescript
         QuickCheck text transformers
       ];
       testToolDepends = [ purescript ];
       description = "Zephyr, tree-shaking for the PureScript language";
       license = lib.licenses.mpl20;
       hydraPlatforms = lib.platforms.none;
       mainProgram = "zephyr";
     }
