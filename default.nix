{ pkgs ? import <nixpkgs> { }, ... }:

  let
    lib = pkgs.lib;
    haskellPkg = pkgName: pkgs.haskellPackages."${pkgName}";

    mkDerivation = haskellPkg "mkDerivation";
    aeson = haskellPkg "aeson";
    ansi-terminal = haskellPkg "ansi-terminal";
    ansi-wl-pprint = haskellPkg "ansi-wl-pprint_0_6_9";
    async = haskellPkg "async";
    base = haskellPkg "base";
    boxes = haskellPkg "boxes";
    bytestring = haskellPkg "bytestring_0_12_1_0";
    containers = haskellPkg "containers_0_7";
    directory = haskellPkg "directory_1_3_9_0";
    filepath = haskellPkg "filepath_1_5_3_0";
    formatting = haskellPkg "formatting";
    Glob = haskellPkg "Glob";
    hspec = haskellPkg "hspec";
    hspec-core = haskellPkg "hspec-core";
    HUnit = haskellPkg "HUnit";
    language-javascript = haskellPkg "language-javascript";
    mtl = haskellPkg "mtl_2_3_1";
    optparse-applicative = haskellPkg "optparse-applicative";
    process = haskellPkg "process_1_6_25_0"; 
    purescript = haskellPkg "purescript"; 
    QuickCheck = haskellPkg "QuickCheck"; 
    safe = haskellPkg "safe";
    text = haskellPkg "text_2_1_1";
    transformers = haskellPkg "transformers_0_6_1_2";
    unordered-containers = haskellPkg "unordered-containers";
    utf8-string = haskellPkg "utf8-string";
  in mkDerivation rec {
    pname = "zephyr";
    version = "5.3";
    src = ./.;
    isLibrary = true;
    isExecutable = true;
    libraryHaskellDepends = [
      aeson ansi-terminal base boxes containers formatting language-javascript mtl purescript safe text unordered-containers
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
    license = lib.licenses.mpl20;
    description = "Zephyr, tree-shaking for the PureScript language";
    homepage = "https://github.com/MaybeJustJames/zephyr";
    maintainers = with pkgs.lib.maintainers; [ malik ];
    hydraPlatforms = lib.platforms.none;
    mainProgram = pname;
  }
