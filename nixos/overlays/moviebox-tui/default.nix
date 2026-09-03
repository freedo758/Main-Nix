{ lib, rustPlatform, fetchFromGitHub, makeWrapper, mpv }:

rustPlatform.buildRustPackage {
  pname = "moviebox-tui";
  version = "unstable-2026-09-03";

  src = fetchFromGitHub {
    owner = "mesamirh";
    repo = "MovieBox-Tui";
    rev = "main"; # pin to a real commit SHA instead of a branch name
    hash = "sha256-aamaxPZRwEvjAHT8WPBKPd7f/NJOODN45rAdFnYSe04"; # nix build will report the correct value on first run
  };

  cargoLock.lockFile = ./Cargo.lock;
   
   doCheck = false;

  nativeBuildInputs = [ makeWrapper ];

  postInstall = ''
    wrapProgram $out/bin/moviebox-tui \
      --prefix PATH : ${lib.makeBinPath [ mpv ]}
  '';

  meta = with lib; {
    description = "Terminal UI for streaming from MovieBox";
    homepage = "https://github.com/mesamirh/MovieBox-Tui";
    license = with licenses; [ mit asl20 ];
    mainProgram = "moviebox-tui";
    platforms = platforms.unix;
  };
}
