final: prev: {
  moviebox-tui = final.callPackage ./moviebox-tui { };

  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
    (pyFinal: pyPrev: {
      click-threading = pyPrev.click-threading.overridePythonAttrs (old: {
        doCheck = false;
      });
    })
  ];
}
